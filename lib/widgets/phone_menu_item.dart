import "package:blogr/controllers/phone_menu_controller.dart";
import "package:blogr/core/colors.dart";
import "package:blogr/widgets/phone_menu_sub_item.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:get/get.dart";

class PhoneMenuItem extends HookWidget {
  final Widget _title;
  final List<PhoneMenuSubItem>? _children;

  const PhoneMenuItem({
    required Widget title,
    List<PhoneMenuSubItem>? children,
  })  : _title = title,
        _children = children;

  Widget title({required bool isOpen}) {
    if (_title is! Text) return _title;
    final t = _title as Text;
    return Text(
      t.data!,
      style: Get.context!.textTheme.subtitle1?.copyWith(
        color: isOpen ? NeutralColors.veryDarkGrayishBlue : PrimaryColors.darkBlue,
      ),
    );
  }

  List<PhoneMenuSubItem>? get children {
    if (_children == null || _children!.isEmpty) return null;

    final c = <PhoneMenuSubItem>[];
    for (final child in _children!) {
      if (child.child is! Text) {
        c.add(child);
        continue;
      }
      final t = child.child as Text;
      c.add(PhoneMenuSubItem(
        onTap: child.onTap,
        child: Text(
          t.data!,
          style: Get.context!.textTheme.subtitle2,
        ),
      ));
    }
    return c;
  }

  @override
  Widget build(BuildContext context) {
    const subItemSize = Size(0, 40);
    const listViewPaddingHeight = 10.0;
    final isOpen = false.obs;

    useEffect(() {
      final phoneMenuController = Get.find<PhoneMenuController>();
      phoneMenuController.addListener(() {
        Get.log("PhoneMenuItem: build(): ${(_title as Text).data} ${isOpen()}");
        // isOpen(false);
      });
    }, const []);

    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.find<PhoneMenuController>().toggleSubMenu();
            isOpen.toggle();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => title(isOpen: isOpen()!)),
                if (children != null) ...[
                  const SizedBox(width: 10),
                  Obx(
                    () => Icon(
                      isOpen()! ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                      color: PrimaryColors.red,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
        if (children != null)
          Obx(
            () => AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey.withOpacity(.2),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: isOpen()! ? 10 : 0),
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 200),
              height: isOpen()! ? children!.length * subItemSize.height + listViewPaddingHeight * 2 : 0,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: listViewPaddingHeight),
                itemCount: children!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final child = children![index];
                  return SizedBox.fromSize(
                    size: subItemSize,
                    child: Center(child: child),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
