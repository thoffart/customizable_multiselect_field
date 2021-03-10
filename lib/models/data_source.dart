import 'package:customizable_multiselect_field/models/data_source_options.dart';

class DataSource<T> {
  DataSource({
    required this.dataList,
    required this.options,
    this.valueList = const [],
  });

  /// A map list that contains the label and the value of the checkbox data.
  final List<Map<String, T>> dataList;

  /// Options to configure the [DataSource]
  final DataSourceOptions options;

  /// The list of the current values of the checkbox.
  /// By default, it's initialValue is provided by [DataSource.valueList] as an empty list.
  final List<T> valueList;

  DataSource.fromJson(Map<String, dynamic> json)
      : dataList = json['data'],
        valueList = json['valueList'],
        options = json['options'];
}
