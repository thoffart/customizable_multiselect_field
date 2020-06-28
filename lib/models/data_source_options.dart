import 'package:flutter/material.dart';

class DataSourceOptions {
  final String valueKey;
  final String labelKey;
  final Text title;
  final Text noItensFoundText;

  DataSourceOptions({
    @required this.valueKey, 
    @required this.labelKey,
    this.title,
    this.noItensFoundText,
  });

  DataSourceOptions.fromJson(Map<String, dynamic> json)
    : valueKey = json['valueKey'],
      labelKey = json['labelKey'],
      title = json['title'],
      noItensFoundText = json['noItensFoundText'];

}