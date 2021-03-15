import 'package:blogr/controllers/phone_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PhoneNavBar extends GetView<PhoneMenuController> {
  const PhoneNavBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/logo.svg',
        ),
        controller.obx(
          (state) => GestureDetector(
            onTap: controller.toggle,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
              child: state!
                  ? SvgPicture.asset(
                      'assets/icon-close.svg',
                      key: const ValueKey('close'),
                      semanticsLabel: 'Close menu',
                    )
                  : SvgPicture.asset(
                      'assets/icon-hamburger.svg',
                      key: const ValueKey('menu'),
                      semanticsLabel: 'Open menu',
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
