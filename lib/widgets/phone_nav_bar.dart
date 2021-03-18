import "package:blogr/controllers/phone_menu_controller.dart";
import "package:blogr/widgets/blogr_logo.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";

class PhoneNavBar extends GetView<PhoneMenuController> {
  const PhoneNavBar();

  @override
  Widget build(BuildContext context) {
    const size = 50.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BlogrLogo(),
        controller.obx(
          (state) {
            return GestureDetector(
            onTap: controller.toggleMenu,
            child: SizedBox(
              width: size,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                child: state!.menuIsOpen
                    ? SvgPicture.asset(
                        "assets/icon-close.svg",
                        key: const ValueKey("close"),
                        semanticsLabel: "Close menu",
                      )
                    : SvgPicture.asset(
                        "assets/icon-hamburger.svg",
                        key: const ValueKey("menu"),
                        semanticsLabel: "Open menu",
                      ),
              ),
            ),
          );
          },
        ),
      ],
    );
  }
}
