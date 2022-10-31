import 'package:app_test/gui/views/profile_view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/gui/widgets/bottombar_widget.dart';
import 'package:app_test/data/models/bottom_bar_model.dart';
import 'package:app_test/gui/views/home_view/home_view.dart';
import 'package:app_test/gui/templates/main_controller.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:app_test/core/provider/bottom_bar_provider.dart';

// Pages

List<BottomBarModel> pages = [
  const BottomBarModel(
    icon: Feather.home,
    label: 'Inicio',
    title: 'Inicio',
    widget: HomeView(),
  ),
  const BottomBarModel(
    icon: Feather.smile,
    label: 'Perfil',
    title: 'Perfil',
    widget: ProfileView(),
  ),
];

class MainTemplate extends StatefulWidget {
  const MainTemplate({Key? key}) : super(key: key);

  @override
  State<MainTemplate> createState() => _MainTemplateState();
}

class _MainTemplateState extends State<MainTemplate> {
  late MainController controller;

  @override
  void initState() {
    controller = MainController(context)..init();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<BottomBarProvider>().currentPage;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: List.generate(
          pages.length,
          (index) => pages[index].widget,
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        pages: pages,
        currentPage: currentPage,
        mainController: controller.pageController,
      ),
    );
  }
}
