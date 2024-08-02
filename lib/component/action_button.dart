import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          child: const Text('Close'),
          onPressed: () {},
        ),
        TextButton(
          child: const Text('Reload'),
          onPressed: () {},
        ),
      ],
    );
  }
}
