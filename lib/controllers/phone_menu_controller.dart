import "package:flutter/material.dart";
import "package:get/get.dart";

class PhoneMenuController extends GetxController with StateMixin<PhoneMenuState> {
  @override
  void onInit() {
    super.onInit();
    change(PhoneMenuState.initial(), status: RxStatus.success());
  }

  void toggleMenu() {
    change(state!.copyWith(menuIsOpen: !state!.menuIsOpen));
  }

  void toggleSubMenu() {
    change(state!.copyWith(subMenuToggle: !state!.subMenuToggle));
  }
}

class PhoneMenuState {
  final bool menuIsOpen;
  final bool subMenuToggle;

  const PhoneMenuState({required this.menuIsOpen, required this.subMenuToggle});

  factory PhoneMenuState.initial() => const PhoneMenuState(menuIsOpen: false, subMenuToggle: false);

  @override
  int get hashCode => hashValues(menuIsOpen, subMenuToggle);

  @override
  bool operator ==(Object other) {
    return other is PhoneMenuState && other.menuIsOpen == menuIsOpen && other.subMenuToggle == subMenuToggle;
  }

  PhoneMenuState copyWith({bool? menuIsOpen, bool? subMenuToggle}) {
    return PhoneMenuState(
      menuIsOpen: menuIsOpen ?? this.menuIsOpen,
      subMenuToggle: subMenuToggle ?? this.subMenuToggle,
    );
  }
}
