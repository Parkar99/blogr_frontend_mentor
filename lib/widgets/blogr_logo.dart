import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class BlogrLogo extends StatelessWidget {
  const BlogrLogo();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/logo.svg",
      height: 40,
    );
  }
}
