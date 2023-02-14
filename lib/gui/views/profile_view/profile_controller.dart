import 'package:flutter/material.dart';
import 'package:app_test/core/utils/hooks/use_navigations.dart';

class ProfileController {
  late BuildContext _context;

  static final ProfileController _singleton = ProfileController._();
  factory ProfileController(BuildContext context) =>
      _singleton._instance(context);
  ProfileController._();

  ProfileController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  void logout() async {
    _redirect();
  }

  void _redirect() {
    useNavigateReplacePage(_context, '/');
  }
}
