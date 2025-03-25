// widgets/themed_text.dart
import 'package:flutter/material.dart';

class ThemedText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const ThemedText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ) ?? TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}