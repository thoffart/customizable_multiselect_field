import 'package:customizable_multiselect_field/customizable_multiselect_flutter.dart';
import 'package:customizable_multiselect_field/models/customizable_multiselect_dialog_options.dart';
import 'package:customizable_multiselect_field/models/customizable_multiselect_widget_options.dart';
import 'package:flutter/material.dart';

import 'customizable_multiselect_widget.dart';

/// A [FormField] that contains a [CustomizableMultiselectWidget].
///
/// This is a widget that wraps a [CustomizableMultiselectWidget] widget in a
/// [FormField].
///
/// A [Form] ancestor is not required. The [Form] simply makes it easier to
/// save, reset, or validate multiple fields at once. To use without a [Form],
/// pass a [GlobalKey] to the constructor and use [GlobalKey.currentState] to
/// save or reset the form field.
///
/// {@tool snippet}
///
/// ```dart
/// CustomizableMultiselectField(
///    dataSourceList: [
///      DataSource<String>(
///        dataList: [
///          {
///            'label': 'Lime',
///            'value': 'test1',
///          },
///        ],
///        valueList: fruitListValue,
///        options: DataSourceOptions(valueKey: 'value', labelKey: 'label', title: Text('Fruits', style: TextStyle(color: Colors.red), textAlign: TextAlign.start,)),
///      ),
///    ],
///    onChanged: ((List<List<dynamic>> value) => print(value)),
///    onSaved: ((List<List<dynamic>> newValueList) {
///      setState(() {
///        valueList = newValueList;
///      });
///    }),
///    validator: ((List<List<dynamic>> value) {
///      if(value.every((element) => element.isEmpty))
///        return 'Please Select a value!';
///      return null;
///
///    })
///  ),
/// ```
///
/// {@end-tool}
/// 
class CustomizableMultiselectField extends FormField<List<List<dynamic>>> {

  CustomizableMultiselectField({
    Key? key,
    FormFieldSetter<List<List<dynamic>>>? onSaved,
    FormFieldValidator<List<List<dynamic>>>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    ValueChanged<List<List<dynamic>>>? onChanged,
    InputDecoration? decoration,
    required this.dataSourceList,
    this.customizableMultiselectDialogOptions = const CustomizableMultiselectDialogOptions(),
    this.customizableMultiselectWidgetOptions = const CustomizableMultiselectWidgetOptions(),
  }) : super(
    key: key,
    onSaved: onSaved,
    validator: validator,
    initialValue: dataSourceList.map((DataSource dataSource) => dataSource.valueList).toList(),
    autovalidateMode: autovalidateMode,
    enabled: customizableMultiselectWidgetOptions.enable,
    builder: (FormFieldState<List<List<dynamic>>> field) {
      final InputDecoration effectiveDecoration = (decoration ?? const InputDecoration())
        .applyDefaults(Theme.of(field.context).inputDecorationTheme);
      void onChangedHandler(List<List<dynamic>> value) {
        if (onChanged != null) {
          onChanged(value);
        }
        field.didChange(value);
      }
      return CustomizableMultiselectWidget(
        dataSourceList: dataSourceList,
        onChanged: onChangedHandler,
        customizableMultiselectDialogOptions: customizableMultiselectDialogOptions,
        customizableMultiselectWidgetOptions: customizableMultiselectWidgetOptions,
        decoration: effectiveDecoration.copyWith(errorText: field.errorText),
        value: field.value,
      );
    },
  );

  /// The list that contains [DataSource] elements to show in the [CustomMultiselectField].
  ///
  /// By default, it's initialValue is provided by [DataSource.valueList] as an empty list.
  ///
  /// It's necessary to provide the defaults [DataSource.options.labelKey] and [DataSource.options.valueKey]
  final List<DataSource> dataSourceList;

  /// The options of the Multiselect dialog.
  ///
  /// If not provided it initiates with his default values.
  final CustomizableMultiselectDialogOptions customizableMultiselectDialogOptions;

  /// The options of the Multiselect input.
  ///
  /// If not provided it initiates with his default values.
  final CustomizableMultiselectWidgetOptions customizableMultiselectWidgetOptions;

  @override
  _CustomizableMultiselectFieldState createState() => _CustomizableMultiselectFieldState();
}

class _CustomizableMultiselectFieldState extends FormFieldState<List<List<dynamic>>> {

  @override
  CustomizableMultiselectField get widget => super.widget as CustomizableMultiselectField;


}