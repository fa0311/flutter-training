import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  const Temperature({
    required this.minTemperature,
    required this.maxTemperature,
    super.key,
  });

  final String minTemperature;
  final String maxTemperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            '$maxTemperature ℃',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.red),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            '$minTemperature ℃',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('minTemperature', minTemperature));
    properties.add(StringProperty('maxTemperature', maxTemperature));
  }
}
