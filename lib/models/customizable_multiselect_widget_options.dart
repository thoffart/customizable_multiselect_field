import 'package:flutter/material.dart';

class CustomizableMultiselectWidgetOptions {

  const CustomizableMultiselectWidgetOptions({
    this.enable = true,
    this.chipColor = Colors.white,
    this.decoration = const InputDecoration(),
    this.chipShape,
    this.hintText,
  });
  /// a bool that defines if the [CustomizableMultiselectField] is enabled or not.
  final bool enable;
  /// the color of the [Chip].
  final Color chipColor;
  /// A [InputDecoration] widget that will be decoration of the input.
  final InputDecoration decoration;
  /// A [ShapeBorder] widget that will be the shape of the [Chip].
  final ShapeBorder chipShape;
  /// A [Text] widget that will appear if no value was selected.
  final Text hintText;

}
