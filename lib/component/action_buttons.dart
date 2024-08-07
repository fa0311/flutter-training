import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    required this.reloadPressed,
    required this.closePressed,
    super.key,
  });
  final VoidCallback? reloadPressed;
  final VoidCallback? closePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: closePressed,
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: reloadPressed,
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('reloadPressed', reloadPressed),
    );
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('closePressed', closePressed),
    );
  }
}
