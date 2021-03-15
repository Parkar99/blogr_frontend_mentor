import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneHeaderContent extends StatelessWidget {
  const PhoneHeaderContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
