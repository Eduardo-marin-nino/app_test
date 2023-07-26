// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingController {
  late BuildContext _context;
  late PageController pageController;
  ValueNotifier<double> currentPage = ValueNotifier(0.0);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static final OnboardingController _singleton = OnboardingController._();
  factory OnboardingController(BuildContext context) =>
      _singleton._instancia(context);
  OnboardingController._();

  OnboardingController _instancia(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  void init() {
    pageController = PageController()..addListener(listenerPageView);
  }

  void listenerPageView() {
    currentPage.value = pageController.page!;
  }

  void nextPage() {
    pageController.nextPage(
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  void redirectLogin() async {
    GoRouter.of(_context).pushReplacementNamed("login");
  }

  void dispose() {
    currentPage.dispose();
    pageController.removeListener(listenerPageView);
    pageController.dispose();
  }
}
