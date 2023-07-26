import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRtcController {
  RTCPeerConnection? peer;
  Function(MediaStream, MediaStreamTrack)? _onAddTrack;

  Function(MediaStream, MediaStreamTrack) get onAddTrack => _onAddTrack!;

  set onAddTrack(Function(MediaStream, MediaStreamTrack) callback) =>
      {_onAddTrack = callback};

  final configuration = {
    'sdpSemantics': 'unified-plan',
    /*'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'},
    ],*/
  };

  final loopbackConstraints = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': false},
    ],
  };

  start() async {
    peer = await createPeerConnection(configuration, loopbackConstraints);
    peer!.onAddTrack = onAddTrack;

    _negotiate();
  }

  _negotiate() async {
    peer!.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeVideo,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.SendRecv));
    peer!.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeAudio,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.SendRecv));

    RTCSessionDescription offer = await peer!.createOffer();
    await peer!.setLocalDescription(offer);
    await _waitICEGathering();
    RTCSessionDescription? localOffer = await peer!.getLocalDescription();

    try {
      Response response = await Dio().post('http://127.0.0.1:8000',
          data: {'sdp': localOffer!.sdp, 'type': localOffer.type});

      if (response.statusCode == 200) {
        RTCSessionDescription answer =
            RTCSessionDescription(response.data['sdp'], 'answer');
        peer!.setRemoteDescription(answer);
      }
    } catch (e) {
      print(e);
    }
  }

  _waitICEGathering() async {
    final Completer completer = Completer();

    if (peer!.iceGatheringState ==
        RTCIceGatheringState.RTCIceGatheringStateComplete) {
      completer.complete();
    } else {
      _checkState(RTCIceGatheringState state) {
        print('RTCIceGatheringState $state');
        if (state == RTCIceGatheringState.RTCIceGatheringStateComplete) {
          peer!.onIceGatheringState = null;
          completer.complete();
        }
      }

      peer!.onIceGatheringState = _checkState;
    }

    return completer.future;
  }

  stop() {
    peer!.close();
  }
}
