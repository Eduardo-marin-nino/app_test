import 'package:go_router/go_router.dart';
import 'package:app_test/gui/views/webRtc_view/web_rtc_view.dart';
import 'package:app_test/gui/views/initial_view/initial_view.dart';
import 'package:app_test/gui/views/profile_view/profile_view.dart';
import 'package:app_test/gui/views/register_view/register_view.dart';
import 'package:app_test/gui/views/onboarding_view/onboarding_view.dart';

class RouterGenerator {
  static List<RouteBase> routesBase() {
    final List<RouteBase> routes = <RouteBase>[
      GoRoute(
        name: "onBoarding",
        path: '/',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        name: "login",
        path: '/login',
        builder: (context, state) => const InitialView(),
        routes: [
          GoRoute(
            path: "register",
            builder: (_, __) => const RegisterView(),
          )
        ],
      ),
      GoRoute(
        name: "profile",
        path: "/profile",
        builder: (_, __) => const ProfileView(),
      ),
      GoRoute(
        name: "webRtcView",
        path: "/webRtcView",
        builder: (_, __) => WebRTCView(),
      )
    ];
    return routes;
  }
}
