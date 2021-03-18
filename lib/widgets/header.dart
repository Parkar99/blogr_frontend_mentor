import "package:blogr/controllers/phone_menu_controller.dart";
import "package:blogr/core/colors.dart";
import "package:blogr/widgets/phone_header_buttons.dart";
import "package:blogr/widgets/phone_header_content.dart";
import "package:blogr/widgets/phone_menu.dart";
import "package:blogr/widgets/phone_nav_bar.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:vector_math/vector_math_64.dart";

class Header extends GetResponsiveView {
  Header();

  @override
  Widget phone() {
    const scaleValue = 3.5;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(100),
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  GradientColors.veryLightRed,
                  GradientColors.lightRed,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..scale(scaleValue, scaleValue)
                    ..translate(-100, -100),
                  child: SvgPicture.asset(
                    "assets/bg-pattern-intro.svg",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: Column(
                    children: const [
                      PhoneNavBar(),
                      SizedBox(height: 150),
                      PhoneHeaderContent(),
                      SizedBox(height: 100),
                      PhoneHeaderButtons(),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 140,
          right: 20,
          left: 20,
          child: Get.find<PhoneMenuController>().obx((state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.decelerate,
              transitionBuilder: (child, animation) {
                final tween = Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: const Offset(0, 0),
                );

                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  ),
                );
              },
              child: !state!.menuIsOpen ? Container() : const PhoneMenu(),
            );
          }),
        ),
      ],
    );
  }
}
