import 'package:flutter/material.dart';

class CustomizableMultiselectWidgetOptions {

  const CustomizableMultiselectWidgetOptions({
    this.enable = true,
    this.chipColor = Colors.white,
    this.decoration = const InputDecoration(),
    this.chipShape,
    this.hintText,
  });

  final bool enable;
  final Color chipColor;
  final InputDecoration decoration;
  final ShapeBorder chipShape;
  final Text hintText;

}
