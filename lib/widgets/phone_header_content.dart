import "package:blogr/core/content.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class PhoneHeaderContent extends StatelessWidget {
  const PhoneHeaderContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          headline,
          style: Get.context?.textTheme.headline1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Text(
          subHeadline,
          style: Get.context?.textTheme.headline3,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
