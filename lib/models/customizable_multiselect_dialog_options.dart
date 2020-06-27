import 'package:flutter/material.dart';

class CustomizableMultiselectDialogOptions {

  const CustomizableMultiselectDialogOptions({
    this.title,
    this.okButtonLabel = 'Ok',
    this.cancelButtonLabel = 'Cancel',
    this.enableSearchBar = true,
    this.searchBarDecoration,
  });

  final String title;
  final String okButtonLabel;
  final String cancelButtonLabel;
  final bool enableSearchBar;
  final InputDecoration searchBarDecoration;

}
