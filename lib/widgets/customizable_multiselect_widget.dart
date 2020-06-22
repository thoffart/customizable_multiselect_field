import 'package:customizable_multiselect_flutter/models/data_source.dart';
import 'package:flutter/material.dart';

class CustomizableMultiselectWidget extends StatefulWidget {

  const CustomizableMultiselectWidget({
    Key key,
    @required this.dataSource,
    this.disabled = false,
    this.enableSearchBar = false,
    this.inputDecoration,
    this.chipColor,
    this.chipShape,
    this.hintText,
    this.dialogTitle,
  }) : super(key: key);

/*   /// Title for the AlertDialog
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final List<List> dataSource;
  final String textField;
  final String valueField;
  final Function change;
  final Function open;
  final Function close;
  final Widget leading;
  final Widget trailing;
  final String okButtonLabel;
  final String cancelButtonLabel;
  final Color fillColor;
  final InputBorder border; */

  final List<DataSource> dataSource;
  final bool disabled;
  final bool enableSearchBar;
  final InputDecoration inputDecoration;
  final Color chipColor;
  final ShapeBorder chipShape;
  final Text hintText;
  final Text dialogTitle;

  @override
  _CustomizableMultiselectWidgetState createState() => _CustomizableMultiselectWidgetState();
}

class _CustomizableMultiselectWidgetState extends State<CustomizableMultiselectWidget> {


  List<Widget> _buildListChip(DataSource dataSource) => dataSource.valueList
    .map((value) => dataSource.dataList.singleWhere((data) => data[dataSource.options.valueKey] == value, orElse: () => null))
    .map((value) =>
      (value != null) 
      ? Chip(
          label: Text(value[dataSource.options.labelKey].toString(), overflow: TextOverflow.ellipsis),
          backgroundColor: widget.chipColor ?? Colors.white,
          shape:  widget.chipShape ?? RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(40.0),
          ),
        )
      : Container()
  ).toList();
  
  bool _checkIfAllDataSourceIsEmpty() {
    return widget.dataSource.every((element) => element.dataList.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        if(!widget.disabled) {

        }
      },
      child: InputDecorator(
        decoration: widget.inputDecoration ?? InputDecoration(
          filled: false,
          errorMaxLines: 4,
        ),
        child:
        (_checkIfAllDataSourceIsEmpty())
        ? Column(
          children: <Widget>[
            ...widget.dataSource.map((DataSource dataSource) => 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if(dataSource.options.title != null)
                      Row(
                        children: [
                          Expanded(child: Text(dataSource.options.title, textAlign: TextAlign.start)),
                        ],
                      ),
                    SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Row(
                        children: <Widget>[
                          dataSource.valueList.isNotEmpty
                          ? Expanded(
                            child: Wrap(
                              spacing: 8.0,
                              children: _buildListChip(dataSource),
                            )
                          )
                          : Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 4, left: 12),
                              child: Text(
                                'Sem valores',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
        : Text('vazio'),
      ),
    );
  }
}