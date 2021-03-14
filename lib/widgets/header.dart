import 'package:blogr/core/colors.dart';
import 'package:blogr/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart';

class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    const scaleValue = 3.5;

    return ClipRRect(
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
                'assets/bg-pattern-intro.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                children: [
                  const NavBar(),
                  const SizedBox(height: 150),
                  Text(
                    "A modern publishing platform",
                    style: Get.context?.textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Grow your audience and build your online brand",
                    style: Get.context?.textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Start for Free'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Learn More'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
