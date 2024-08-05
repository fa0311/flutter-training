import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  const Temperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            '** ℃',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.red),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            '** ℃',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
