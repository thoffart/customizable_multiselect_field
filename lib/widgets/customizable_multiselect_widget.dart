import 'package:customizable_multiselect_field/models/customizable_multiselect_dialog_options.dart';
import 'package:customizable_multiselect_field/models/customizable_multiselect_widget_options.dart';
import 'package:customizable_multiselect_field/models/data_source.dart';
import 'package:customizable_multiselect_field/utils/extensions/extended-iterable.dart';
import 'package:customizable_multiselect_field/widgets/customizable_multiselect_dialog.dart';
import 'package:flutter/material.dart';

class CustomizableMultiselectWidget extends StatefulWidget {

  const CustomizableMultiselectWidget({
    Key key,
    @required this.dataSourceList,
    @required this.customizableMultiselectDialogOptions,
    @required this.customizableMultiselectWidgetOptions,
    @required this.decoration,
    @required this.onChanged,
    @required this.value
  }) : super(key: key);

  final List<DataSource> dataSourceList;
  final CustomizableMultiselectDialogOptions customizableMultiselectDialogOptions;
  final CustomizableMultiselectWidgetOptions customizableMultiselectWidgetOptions;
  final InputDecoration decoration;
  final ValueChanged<List<List<dynamic>>> onChanged;
  final List<List<dynamic>> value;

  @override
  _CustomizableMultiselectWidgetState createState() => _CustomizableMultiselectWidgetState();

}

class _CustomizableMultiselectWidgetState extends State<CustomizableMultiselectWidget> {

  List<Widget> _buildListChip(DataSource dataSource, int index) => widget.value[index]
    .map((value) => dataSource.dataList.singleWhere((data) => data[dataSource.options.valueKey] == value,orElse: () => null))
    .map((value) => (value != null)
      ? Chip(
        label: Text(value[dataSource.options.labelKey].toString(), overflow: TextOverflow.ellipsis),
        backgroundColor: widget.customizableMultiselectWidgetOptions.chipColor,
        shape: widget.customizableMultiselectWidgetOptions.chipShape ?? RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(40.0),
        ),
      )
    : Container())
  .toList();

  bool _checkIfAllDataSourceIsEmpty() {
    return widget.dataSourceList.every((DataSource element) => element.valueList.isEmpty);
  }


  InputDecoration _getEffectiveDecoration() {
    final ThemeData themeData = Theme.of(context);
    final InputDecoration effectiveDecoration = widget.decoration
      .applyDefaults(themeData.inputDecorationTheme)
      .copyWith(
        enabled: widget.customizableMultiselectWidgetOptions.enable,
        hintMaxLines: widget.decoration?.hintMaxLines,
      );
    return effectiveDecoration.copyWith(
      errorText: effectiveDecoration.errorText ?? '',
      counterStyle: effectiveDecoration.errorStyle
        ?? themeData.textTheme.caption.copyWith(color: themeData.errorColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if(widget.customizableMultiselectWidgetOptions.enable) {
          final List newSelectedValues = await showDialog<List>(
            context: context,
            builder: (BuildContext context) {
              return CustomizableMultiselectDialog(
                selectedValues: widget.value,
                dataSourceList: widget.dataSourceList,
                customizableMultiselectDialogOptions: widget.customizableMultiselectDialogOptions,
              );
            },
          );
          if(newSelectedValues != null) {
            widget.onChanged(newSelectedValues);
          }
        }
      },
      child: InputDecorator(
        decoration: _getEffectiveDecoration(),
        child: (!_checkIfAllDataSourceIsEmpty())
            ? Column(
                children: <Widget>[
                  ...widget.dataSourceList.mapIndex(
                    (DataSource dataSource, int index) => (widget.value[index].isNotEmpty)
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          (dataSource.options.title != null)
                            ? Row(
                              children: [
                                Expanded(
                                  child: dataSource.options.title
                                ),
                              ],
                            )
                            : Divider(),
                          SizedBox(height: 4),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Wrap(
                                  spacing: 8.0,
                                  children:
                                      _buildListChip(dataSource, index),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    : Container(),
                  )
                ],
              )
            : Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: widget.customizableMultiselectWidgetOptions.hintText ?? Text('Please Select a value', style: TextStyle(color: Colors.grey)),
            ),
      ),
    );
  }
}
