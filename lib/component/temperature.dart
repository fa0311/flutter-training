import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  const Temperature({
    required this.minTemperature,
    required this.maxTemperature,
    super.key,
  });

  final int? minTemperature;
  final int? maxTemperature;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '${minTemperature ?? "**"} ℃',
          style: textStyle.copyWith(color: Colors.blue),
        ),
        Text(
          '${maxTemperature ?? "**"} ℃',
          style: textStyle.copyWith(color: Colors.red),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('minTemperature', minTemperature));
    properties.add(IntProperty('maxTemperature', maxTemperature));
  }
}
