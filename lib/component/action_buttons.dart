import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    required this.onReloadPressed,
    required this.onClosePressed,
    super.key,
  });
  final VoidCallback? onReloadPressed;
  final VoidCallback? onClosePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onClosePressed,
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: onReloadPressed,
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
      ObjectFlagProperty<VoidCallback?>.has(
        'onReloadPressed',
        onReloadPressed,
      ),
    );
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has(
        'onClosePressed',
        onClosePressed,
      ),
    );
  }
}
