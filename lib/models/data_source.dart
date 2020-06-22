import 'package:customizable_multiselect_flutter/models/data_source_options.dart';
import 'package:flutter/material.dart';


class DataSource<T> {
  final List<Map<String, T>> dataList;
  final DataSourceOptions options;
  final List<T> valueList;

  DataSource({
    @required this.dataList, 
    @required this.options, 
    @required this.valueList, 
  });

  DataSource.fromJson(Map<String, dynamic> json)
    : dataList = json['data'],
      valueList = json['valueList'],
      options = json['options'];

}