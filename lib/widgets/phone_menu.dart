import "package:blogr/widgets/phone_menu_item.dart";
import "package:blogr/widgets/phone_menu_sub_item.dart";
import "package:flutter/material.dart";

class PhoneMenu extends StatelessWidget {
  const PhoneMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          PhoneMenuItem(
            title: const Text("Product"),
            children: [
              PhoneMenuSubItem(onTap: () {}, child: const Text("Product 1")),
              PhoneMenuSubItem(onTap: () {}, child: const Text("Product 2")),
              PhoneMenuSubItem(onTap: () {}, child: const Text("Product 3")),
            ],
          ),
          PhoneMenuItem(
            title: const Text("Company"),
            children: [
              PhoneMenuSubItem(onTap: () {}, child: const Text("Company 1")),
              PhoneMenuSubItem(onTap: () {}, child: const Text("Company 2")),
              PhoneMenuSubItem(onTap: () {}, child: const Text("Company 3")),
            ],
          ),
          PhoneMenuItem(
            title: const Text("Connect"),
            children: [
              PhoneMenuSubItem(onTap: () {}, child: const Text("Contact")),
              PhoneMenuSubItem(onTap: () {}, child: const Text("Newsletter")),
              PhoneMenuSubItem(onTap: () {}, child: const Text("LinkedIn")),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
