import 'package:customizable_multiselect_flutter/models/customizable_multiselect_dialog_options.dart';
import 'package:customizable_multiselect_flutter/models/customizable_multiselect_widget_options.dart';
import 'package:customizable_multiselect_flutter/models/data_source.dart';
import 'package:customizable_multiselect_flutter/widgets/customizable_multiselect_dialog.dart';
import 'package:flutter/material.dart';

class CustomizableMultiselectWidget extends StatefulWidget {

  const CustomizableMultiselectWidget({
    Key key,
    @required this.dataSourceList,
    this.onChanged,
    this.onFieldSubmitted,
    @required this.customizableMultiselectDialogOptions,
    @required this.customizableMultiselectWidgetOptions,
  }) : super(key: key);

  final List<DataSource> dataSourceList;
  final ValueChanged<List<List<dynamic>>> onChanged;
  final ValueChanged<List<List<dynamic>>> onFieldSubmitted;
  final CustomizableMultiselectDialogOptions customizableMultiselectDialogOptions;
  final CustomizableMultiselectWidgetOptions customizableMultiselectWidgetOptions;

  @override
  _CustomizableMultiselectWidgetState createState() => _CustomizableMultiselectWidgetState();

}

class _CustomizableMultiselectWidgetState extends State<CustomizableMultiselectWidget> {

  List<Widget> _buildListChip(DataSource dataSourceList) => dataSourceList.valueList
    .map((value) => dataSourceList.dataList.singleWhere((data) => data[dataSourceList.options.valueKey] == value,orElse: () => null))
    .map((value) => (value != null)
      ? Chip(
        label: Text(value[dataSourceList.options.labelKey].toString(), overflow: TextOverflow.ellipsis),
        backgroundColor: widget.customizableMultiselectWidgetOptions.chipColor,
        shape: widget.customizableMultiselectWidgetOptions.chipShape ?? RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(40.0),
        ),
      )
    : Container())
  .toList();

  bool _checkIfAllDataSourceIsEmpty() {
    return widget.dataSourceList
        .every((DataSource element) => element.dataList.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => {
        if(widget.customizableMultiselectWidgetOptions.enable) {
          await showDialog<List>(
            context: context,
            builder: (BuildContext context) {
              return CustomizableMultiselectDialog(
                dataSourceList: widget.dataSourceList,
                customizableMultiselectDialogOptions: widget.customizableMultiselectDialogOptions,
              );
            },
          )
        }
      },
      child: InputDecorator(
        decoration: widget.customizableMultiselectWidgetOptions.decoration,
        child: (!_checkIfAllDataSourceIsEmpty())
            ? Column(
                children: <Widget>[
                  ...widget.dataSourceList.map(
                    (DataSource dataSourceList) => (dataSourceList.valueList.isNotEmpty)
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          if (dataSourceList.options.title != null)
                            Row(
                              children: [
                                Expanded(
                                    child: Text(dataSourceList.options.title,
                                        textAlign: TextAlign.start)),
                              ],
                            ),
                          SizedBox(height: 4),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Wrap(
                                  spacing: 8.0,
                                  children:
                                      _buildListChip(dataSourceList),
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
            : widget.customizableMultiselectWidgetOptions.hintText,
      ),
    );
  }
}
