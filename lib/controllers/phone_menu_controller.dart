import 'package:get/get.dart';

class PhoneMenuController extends GetxController with StateMixin<bool> {
  @override
  void onInit() {
    super.onInit();
    change(false, status: RxStatus.success());
  }

  void toggle() {
    change(!state!);
  }
}
