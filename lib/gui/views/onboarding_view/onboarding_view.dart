import 'package:app_test/core/paths/local_paths.dart';
import 'package:app_test/gui/widgets/pagination_carousel.dart';
import 'package:flutter/material.dart';

// Widgets
import 'widgets/button.dart';
import 'widgets/sliders.dart';
import 'widgets/information.dart';

// Controller
import 'onboarding_controller.dart';

List<Map<String, String>> sliders = [
  {
    'image': LocalPaths.onBoardingOne,
    'label': 'Bienvenido a Hipal',
    'description':
        'La herramienta que simplifica tus tareas y te conecta con todo lo necesario para una gestión eficiente.',
  },
  {
    'image': LocalPaths.onBoardingThree,
    'label': 'Mantén todo en orden',
    'description':
        'Con Hipal, podrás mantener tus actividades organizadas, estar al tanto de eventos importantes y comunicarte de manera efectiva.',
  },
  {
    'image': LocalPaths.onBoardingTwo,
    'label': 'Colabora efectivamente.',
    'description':
        'Trabaja en conjunto con nuestra aplicación,  compartiendo información y manteniendo a todos en sintonía para mayor confianza.',
  }
];

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late OnboardingController _controller;

  @override
  void initState() {
    _controller = OnboardingController(context)..init();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: (paddingBottom + 5)),
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() => ValueListenableBuilder<double>(
        valueListenable: _controller.currentPage,
        builder: (BuildContext _, double currentPage, Widget? __) => Column(
          children: [
            _sliders(currentPage),
            const SizedBox(height: 20),
            _info(currentPage.round()),
            const SizedBox(height: 35),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 90, 20, 0),
                child: _footer(currentPage.round())),
          ],
        ),
      );

  Widget _sliders(double currentPage) => Sliders(
        currentPage: currentPage,
        sliders: sliders,
        pageController: _controller.pageController,
      );

  Widget _info(int currentPage) {
    return Column(
      children: [
        InformationOnboarding(
          label: sliders[currentPage]['label']!,
          description: sliders[currentPage]['description']!,
        ),
        const SizedBox(height: 25),
        _pagination(currentPage),
      ],
    );
  }

  Widget _footer(int currentPage) => AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _redirectButton(),
            _nextButton(currentPage),
          ],
        ),
      );

  Widget _nextButton(int currentPage) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: const Color(0xff262626),
            borderRadius: BorderRadius.circular(25)),
        child: ButtonOnboarding(
          onTap: currentPage == sliders.length - 1
              ? _controller.redirectLogin
              : _controller.nextPage,
          label: 'Siguiente',
          colorButton: Colors.white,
        ),
      );

  Widget _redirectButton() => ButtonOnboarding(
        onTap: _controller.redirectLogin,
        label: 'Saltar',
      );

  Widget _pagination(int currentPage) => PaginationCarousel(
        quantity: sliders.length,
        currentPage: currentPage,
        sizeSelectIndicator: 25,
        sizeUnSelectIndicator: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      );
}
