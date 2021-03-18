import "package:blogr/widgets/header.dart";
import "package:blogr/widgets/section_1.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class HomePage extends HookWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(),
          curve: Curves.linear,
        );
      }
    }, [scrollController.hasClients]);

    return Scaffold(
      body: ListView(
        controller: scrollController,
        children: [
          Header(),
          Section1(),
        ],
      ),
    );
  }
}
