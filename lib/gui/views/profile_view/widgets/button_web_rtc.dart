import 'package:app_test/core/utils/hooks/use_navigations.dart';
import 'package:flutter/material.dart';

class ButtonWebRTC extends StatelessWidget {
  const ButtonWebRTC({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => useNavigatePushName(context, "webRtcView"),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text(
          "Llamada",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }
}
