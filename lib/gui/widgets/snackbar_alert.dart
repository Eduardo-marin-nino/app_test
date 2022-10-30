import 'package:app_test/data/models/type_alert_snackbar.dart';
import 'package:flutter/material.dart';

enum TypeAlert {
  success,
  error,
  warning,
  info,
}

const Map<String, TypeAlertSnackBar> typeAlert = {
  'success': TypeAlertSnackBar(
    label: 'Success',
    color: Colors.green,
    icon: Icons.check_circle,
  ),
  'error': TypeAlertSnackBar(
    label: 'Error',
    icon: Icons.error,
    color: Colors.red,
  ),
};

class SnackBarFloating {
  static Future<SnackBarClosedReason> show(
    BuildContext context,
    String message, {
    IconData? icon,
    TypeAlert type = TypeAlert.success,
    Color? backgroundColor,
    Duration? duration = const Duration(milliseconds: 4000),
  }) async {
    final typeAlert = _getTypeAlertSnackBar(type).copyWith(
      icon: icon,
      label: message,
      color: backgroundColor,
    );

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            typeAlert.icon,
            size: 22,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Flexible(child: Text(typeAlert.label)),
        ],
      ),
      backgroundColor: typeAlert.color,
      behavior: SnackBarBehavior.floating,
    );
    return await ScaffoldMessenger.of(context).showSnackBar(snackBar).closed;
  }

  static TypeAlertSnackBar _getTypeAlertSnackBar(TypeAlert type) {
    switch (type) {
      case TypeAlert.error:
        return typeAlert['error']!;
      default:
        return typeAlert['success']!;
    }
  }
}
