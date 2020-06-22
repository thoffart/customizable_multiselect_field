import 'package:flutter/material.dart';

class DataSourceOptions {
  final String valueKey;
  final String labelKey;
  final String title;

  DataSourceOptions({
    @required this.valueKey, 
    @required this.labelKey,
    this.title,
  });

  DataSourceOptions.fromJson(Map<String, String> json)
    : valueKey = json['valueKey'],
      labelKey = json['labelKey'],
      title = json['title'];

}