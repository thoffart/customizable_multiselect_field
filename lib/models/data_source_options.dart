import 'package:flutter/material.dart';

class DataSourceOptions {
  DataSourceOptions({
    required this.valueKey,
    required this.labelKey,
    this.title,
    this.noItensFoundText,
  });

  /// A string that define the key to access the value of the [DataSource.dataList].
  final String valueKey;

  /// A string that define the key to access the label of the [DataSource.dataList].
  final String labelKey;

  /// A [Text] widget that will be the title of the section this data inside the [AlertDialog].
  final Text? title;

  /// A [Text] widget that will be the text if no itens was found while occuring a search inside the [AlertDialog].
  final Text? noItensFoundText;

  DataSourceOptions.fromJson(Map<String, dynamic> json)
      : valueKey = json['valueKey'],
        labelKey = json['labelKey'],
        title = json['title'],
        noItensFoundText = json['noItensFoundText'];
}
