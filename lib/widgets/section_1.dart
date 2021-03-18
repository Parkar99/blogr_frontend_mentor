import "package:blogr/core/content.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Section1 extends GetResponsiveView {
  @override
  Widget phone() {
    return Column(
      children: const [
        SizedBox(height: 100),
        _Title(),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Text(
      section1Headline,
      style: Get.textTheme?.headline2,
    );
  }
}
