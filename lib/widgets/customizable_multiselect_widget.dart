import 'package:customizable_multiselect_flutter/models/customizable_multiselect_dialog_options.dart';
import 'package:customizable_multiselect_flutter/models/customizable_multiselect_widget_options.dart';
import 'package:customizable_multiselect_flutter/models/data_source.dart';
import 'package:customizable_multiselect_flutter/widgets/customizable_multiselect_dialog.dart';
import 'package:customizable_multiselect_flutter/utils/extensions/extended-iterable.dart';
import 'package:flutter/material.dart';

class CustomizableMultiselectWidget extends StatefulWidget {

  const CustomizableMultiselectWidget({
    Key key,
    @required this.dataSourceList,
    this.onChanged,
    @required this.customizableMultiselectDialogOptions,
    @required this.customizableMultiselectWidgetOptions,
  }) : super(key: key);

  final List<DataSource> dataSourceList;
  final ValueChanged<List<List<dynamic>>> onChanged;
  final CustomizableMultiselectDialogOptions customizableMultiselectDialogOptions;
  final CustomizableMultiselectWidgetOptions customizableMultiselectWidgetOptions;

  @override
  _CustomizableMultiselectWidgetState createState() => _CustomizableMultiselectWidgetState();

}

class _CustomizableMultiselectWidgetState extends State<CustomizableMultiselectWidget> {

  List<Widget> _buildListChip(DataSource dataSource, int index) => dataSource.valueList
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if(widget.customizableMultiselectWidgetOptions.enable) {
          final List newSelectedValues = await showDialog<List>(
            context: context,
            builder: (BuildContext context) {
              return CustomizableMultiselectDialog(
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
        decoration: widget.customizableMultiselectWidgetOptions.decoration,
        child: (!_checkIfAllDataSourceIsEmpty())
            ? Column(
                children: <Widget>[
                  ...widget.dataSourceList.mapIndex(
                    (DataSource dataSource, int index) => (dataSource.valueList.isNotEmpty)
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
