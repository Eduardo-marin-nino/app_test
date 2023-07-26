import 'dart:core';
import 'dart:io';

import 'package:app_test/gui/views/webRtc_view/web_rtc_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:path_provider/path_provider.dart';

class WebRTCView extends StatefulWidget {
  @override
  State<WebRTCView> createState() => _WebRTCViewState();
}

class _WebRTCViewState extends State<WebRTCView> {
  late WebRtcController controller;
  MediaStream? _localStream;
  final _localRenderer = RTCVideoRenderer();
  final _videoRenderer = RTCVideoRenderer();
  bool _inCalling = false;
  bool _isTorchOn = false;
  MediaRecorder? _mediaRecorder;
  bool get _isRec => _mediaRecorder != null;

  List<MediaDeviceInfo>? _mediaDevicesList;

  @override
  void initState() {
    super.initState();
    initRenderers();
    controller = WebRtcController();
    navigator.mediaDevices.ondevicechange = (event) async {
      _mediaDevicesList = await navigator.mediaDevices.enumerateDevices();
    };
    controller.onAddTrack = _handleStream;
  }

  void _handleStream(MediaStream stream, MediaStreamTrack track) {
    if (track.kind == 'video') {
      _videoRenderer.srcObject = stream;
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    if (_inCalling) {
      _hangUp();
    }
    _localRenderer.dispose();
    navigator.mediaDevices.ondevicechange = null;
  }

  void initRenderers() async {
    await _videoRenderer.initialize();
    await _localRenderer.initialize();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void _makeCall() async {
    final mediaConstraints = <String, dynamic>{
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth':
              '640', // Provide your own width, height and frame rate here
          'minHeight': '480',
          'minFrameRate': '30',
        },
        'facingMode': 'user',
        'optional': [],
      }
    };

    try {
      var stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
      _mediaDevicesList = await navigator.mediaDevices.enumerateDevices();
      _localStream = stream;
      _localRenderer.srcObject = _localStream;
    } catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    controller.start();
    setState(() {
      _inCalling = true;
    });
  }

  void _hangUp() async {
    try {
      if (kIsWeb) {
        _localStream?.getTracks().forEach((track) => track.stop());
      }
      await _videoRenderer.dispose();
      await _localStream?.dispose();
      _localRenderer.srcObject = null;
      controller.stop();
      setState(() {
        _inCalling = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void _startRecording() async {
    if (_localStream == null) throw Exception('Stream is not initialized');
    if (Platform.isIOS) {
      print('Recording is not available on iOS');
      return;
    }
    final storagePath = await getExternalStorageDirectory();
    if (storagePath == null) throw Exception('Can\'t find storagePath');

    final filePath = '${storagePath.path}/webrtc_sample/test.mp4';
    _mediaRecorder = MediaRecorder();
    setState(() {});

    final videoTrack = _localStream!
        .getVideoTracks()
        .firstWhere((track) => track.kind == 'video');
    controller.start();
    await _mediaRecorder!.start(
      filePath,
      videoTrack: videoTrack,
    );
  }

  void _stopRecording() async {
    await _mediaRecorder?.stop();
    setState(() {
      _mediaRecorder = null;
    });
  }

  void _captureFrame() async {
    if (_localStream == null) throw Exception('Stream is not initialized');

    final videoTrack = _localStream!
        .getVideoTracks()
        .firstWhere((track) => track.kind == 'video');
    final frame = await videoTrack.captureFrame();
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content:
                  Image.memory(frame.asUint8List(), height: 720, width: 1280),
              actions: <Widget>[
                TextButton(
                  onPressed: Navigator.of(context, rootNavigator: true).pop,
                  child: Text('OK'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba WEBRTC '),
        actions: _inCalling
            ? <Widget>[
                IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: _captureFrame,
                ),
                IconButton(
                  icon: Icon(_isRec ? Icons.stop : Icons.fiber_manual_record),
                  onPressed: _isRec ? _stopRecording : _startRecording,
                ),
                PopupMenuButton<String>(
                  onSelected: _selectAudioOutput,
                  itemBuilder: (BuildContext context) {
                    if (_mediaDevicesList != null) {
                      return _mediaDevicesList!
                          .where((device) => device.kind == 'audiooutput')
                          .map((device) {
                        return PopupMenuItem<String>(
                          value: device.deviceId,
                          child: Text(device.label),
                        );
                      }).toList();
                    }
                    return [];
                  },
                ),
              ]
            : null,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(children: [
            Container(
              color: const Color(0xF0000000),
              child: RTCVideoView(_videoRenderer),
            ),
            Positioned(
                right: 15,
                bottom: 15,
                child: Container(
                  width: 150,
                  height: 267,
                  color: const Color(0xF0000000),
                  child: RTCVideoView(_localRenderer, mirror: true),
                )),
          ]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _inCalling ? _hangUp : _makeCall,
        tooltip: _inCalling ? 'Hangup' : 'Call',
        child: Icon(_inCalling ? Icons.call_end : Icons.phone),
      ),
    );
  }

  void _selectAudioOutput(String deviceId) {
    _localRenderer.audioOutput(deviceId);
  }
}
