import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/theme/colors_app_theme.dart';
import 'package:app_test/data/models/bottom_bar_model.dart';
import 'package:app_test/core/provider/bottom_bar_provider.dart';

class BottomNavigation extends StatelessWidget {
  final int currentPage;
  final List<BottomBarModel> pages;
  final PageController mainController;

  const BottomNavigation({
    Key? key,
    required this.pages,
    required this.currentPage,
    required this.mainController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: generateOptions(context),
      currentIndex: currentPage,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedFontSize: 13.0,
      unselectedFontSize: 13.0,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[400],
      backgroundColor: Colors.white,
      selectedItemColor: ColorsAppTheme.secondColor,
      onTap: (int index) {
        mainController.jumpToPage(index);
        context.read<BottomBarProvider>().currentPage = index;
      },
    );
  }

  List<BottomNavigationBarItem> generateOptions(BuildContext context) {
    return List.generate(pages.length, (int index) {
      return BottomNavigationBarItem(
        icon: Icon(
          pages[index].icon,
        ),
        label: pages[index].label,
      );
    });
  }
}
