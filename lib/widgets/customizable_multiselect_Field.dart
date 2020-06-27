import 'package:customizable_multiselect_flutter/customizable_multiselect_flutter.dart';
import 'package:customizable_multiselect_flutter/models/customizable_multiselect_dialog_options.dart';
import 'package:customizable_multiselect_flutter/models/customizable_multiselect_widget_options.dart';
import 'package:flutter/material.dart';

class CustomizableMultiselectField extends FormField<List<List<dynamic>>> {

  CustomizableMultiselectField({
    Key key,
    FormFieldSetter<List<List<dynamic>>> onSaved,
    FormFieldValidator<List<List<dynamic>>> validator,
    bool autovalidate = false,
    ValueChanged<List<List<dynamic>>> onChanged,
    @required this.dataSourceList,
    this.customizableMultiselectDialogOptions = const CustomizableMultiselectDialogOptions(),
    this.customizableMultiselectWidgetOptions = const CustomizableMultiselectWidgetOptions(),
  }) : super(
    key: key,
    onSaved: onSaved,
    validator: validator,
    initialValue: dataSourceList.map((DataSource dataSource) => dataSource.valueList).toList(),
    autovalidate: autovalidate,
    enabled: customizableMultiselectWidgetOptions.enable,
    builder: (FormFieldState<List<List<dynamic>>> field) {
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
      );
    },
  );

  final List<DataSource> dataSourceList;
  final CustomizableMultiselectDialogOptions customizableMultiselectDialogOptions;
  final CustomizableMultiselectWidgetOptions customizableMultiselectWidgetOptions;

  @override
  _CustomizableMultiselectFieldState createState() => _CustomizableMultiselectFieldState();
}

class _CustomizableMultiselectFieldState extends FormFieldState<List<List<dynamic>>> {

  @override
  CustomizableMultiselectField get widget => super.widget as CustomizableMultiselectField;


}