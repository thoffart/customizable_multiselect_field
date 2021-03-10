import 'package:flutter/material.dart';

class CustomizableMultiselectDialogOptions {
  const CustomizableMultiselectDialogOptions({
    this.title,
    this.okButtonLabel = 'Ok',
    this.cancelButtonLabel = 'Cancel',
    this.enableSearchBar = true,
    this.searchBarDecoration,
  });

  /// A [Text] widget that will be the title of the [AlertDialog].
  final Text? title;

  /// A string that define the label of the ok button of the [AlertDialog].
  final String okButtonLabel;

  /// A string that define the label of the cancel button of the [AlertDialog].
  final String cancelButtonLabel;

  /// A boolean that define if the search bar should appear.
  final bool enableSearchBar;

  /// A [InputDecoration] widget that will be decoration of the search bar.
  final InputDecoration? searchBarDecoration;
}
