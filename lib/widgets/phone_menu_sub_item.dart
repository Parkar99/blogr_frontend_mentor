import "package:flutter/material.dart";

class PhoneMenuSubItem extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const PhoneMenuSubItem({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}
