import 'package:customizable_multiselect_flutter/customizable_multiselect_flutter.dart';
import 'package:flutter/material.dart';

class CustomizableMultiselectField extends FormField<List<List<dynamic>>> {

  CustomizableMultiselectField({
    Key key,
    FormFieldSetter<List<List<dynamic>>> onSaved,
    FormFieldValidator<List<List<dynamic>>> validator,
    List<List<dynamic>> initialValue,
    bool autovalidate = false,
    bool enabled,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<List<List<dynamic>>> onChanged,
    ValueChanged<List<List<dynamic>>> onFieldSubmitted,
    @required this.dataSource,
  }) : super(
    key: key,
    onSaved: onSaved,
    validator: validator,
    initialValue: const [],
    autovalidate: autovalidate,
    enabled: enabled ?? decoration?.enabled ?? true,
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
        dataSource: dataSource,
        enable: enabled,
        decoration: effectiveDecoration,
        onChanged: onChangedHandler,
      );
    },
  );

  final List<DataSource> dataSource;

  @override
  _CustomizableMultiselectFieldState createState() => _CustomizableMultiselectFieldState();
}

class _CustomizableMultiselectFieldState extends FormFieldState<List<List<dynamic>>> {

  @override
  CustomizableMultiselectField get widget => super.widget as CustomizableMultiselectField;

}