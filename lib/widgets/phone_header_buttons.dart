import 'package:flutter/material.dart';

class PhoneHeaderButtons extends StatelessWidget {
  const PhoneHeaderButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Start for Free'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Learn More'),
        ),
      ],
    );
  }
}
