import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vitamart/controllers/home/HomeController.dart';
import 'package:vitamart/shared/constants/Coolors.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Coolors.primary.withOpacity(0.77),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _bottomAppBarItem(
                      icon: Icons.home_outlined,
                      iconSelected: Icons.home,
                      size: 30,
                      page: 0),
                  _bottomAppBarItem(
                      icon: FontAwesomeIcons.bell,
                      iconSelected: FontAwesomeIcons.solidBell,
                      page: 1),
                  _bottomAppBarItem(
                      icon: FontAwesomeIcons.user,
                      iconSelected: FontAwesomeIcons.solidUser,
                      page: 2),
                ],
              )),
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [...controller.pages],
      ),
    );
  }

  Widget _bottomAppBarItem({icon, iconSelected, size, page}) {
    final isSelected = controller.currentPage == page;

    return IconButton(
      onPressed: () => controller.goToTab(page),
      icon: FaIcon(
        isSelected ? iconSelected : icon,
        color: Coolors.grey,
        size: size ?? 22,
      ),
    );
  }
}
