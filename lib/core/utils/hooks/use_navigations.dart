import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

useNavigatePushName(
  BuildContext context,
  String route,
) {
  GoRouter.of(context).pushNamed(
    route,
  );
}

void useNavigatePop(BuildContext context) async {
  GoRouter.of(context).pop();
}

useNavigateReplaceName(BuildContext context, String route,
    {Map<String, dynamic>? arguments}) {
  GoRouter.of(context).pushReplacementNamed(
    route,
  );
}

useNavigateReplacePage(BuildContext context, String route) {
  Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
}
