import 'package:flutter/material.dart';


class HintField extends StatelessWidget
{
  /// The height of the field.
  ///
  /// Should be not less than the text height.
  final double height;

  /// The text to be shown.
  final String? text;

  /// The style of the text.
  ///
  /// If not specified, `Theme.of(context).textTheme.bodySmall` will be used.
  final TextStyle? style;

  const HintField({
    super.key,
    required this.height,
    required this.text,
    this.style,
  });

  @override
  Widget build(final BuildContext context)
  {
    return Container(
      height: text == null ? 0 : height,
      alignment: Alignment.bottomLeft,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        opacity: text == null ? 0.0 : 1.0,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              bottom: text == null ? height / 4 : 0,
              child: Text(text ?? '',
                style: style ?? Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
