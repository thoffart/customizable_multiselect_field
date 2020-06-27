import 'package:customizable_multiselect_flutter/customizable_multiselect_flutter.dart';
import 'package:customizable_multiselect_flutter/models/customizable_multiselect_dialog_options.dart';
import 'package:customizable_multiselect_flutter/utils/extensions/extended-iterable.dart';
import 'package:flutter/material.dart';

class CustomizableMultiselectDialog<V> extends StatefulWidget {
  CustomizableMultiselectDialog({
    Key key,
    @required this.dataSourceList,
    @required this.customizableMultiselectDialogOptions,
  }) : super(key: key);

  final List<DataSource> dataSourceList;
  final CustomizableMultiselectDialogOptions customizableMultiselectDialogOptions;

  @override
  State<StatefulWidget> createState() => _CustomizableMultiselectDialogState<V>();

}

class _CustomizableMultiselectDialogState<V>
    extends State<CustomizableMultiselectDialog<V>> {
  var _selectedValues = List<List<V>>();
  String _filterText;

  void initState() {
    super.initState();
    _selectedValues = widget.dataSourceList
        .map((DataSource dataSource) => dataSource.valueList)
        .toList();
  }

  void _onItemCheckedChange(V itemValue, bool checked, int index) {
    setState(() {
      if (checked) {
        _selectedValues[index].add(itemValue);
      } else {
        _selectedValues[index].remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  void filterSearchResults(String text) {
    setState(() {
      _filterText = text;
    });
  }

  Widget _searchBar() => Padding(
    padding: EdgeInsets.all(16),
    child: TextField(
      decoration: widget.customizableMultiselectDialogOptions.searchBarDecoration ?? InputDecoration(
        contentPadding: const EdgeInsets.all(8.0),
        prefixIcon: Icon(Icons.search),
        focusedBorder: new OutlineInputBorder(
          borderRadius:BorderRadius.circular(50.0),
          borderSide: new BorderSide(
            color: Colors.blue,
          )
        ),
        border: new OutlineInputBorder(
          borderRadius:BorderRadius.circular(50.0),
          borderSide: new BorderSide(
            color: Colors.blue
          )
        ),
        hintText: 'Search...',
      ),
      style: TextStyle(
        fontSize: 16.0,
        fontFamily: "Hind",
        decoration: TextDecoration.none,
      ),
      onChanged: (value) => filterSearchResults(value),
    )
  );


  Widget _buildDataSourceTiles( DataSource dataSource, int dataSourceIndex, Widget Function(Map<String, dynamic> value, String labelKey, String valueKey, int dataSourceIndex) builderTile) {
    final itemList = dataSource.dataList.map((Map<String, dynamic> value) => builderTile(
      value,
      dataSource.options.labelKey,
      dataSource.options.valueKey,
      dataSourceIndex
    )).toList()..removeWhere((value) => value == null);
    return Column(
      children: [
        (dataSource.options.title != null)
         ? Padding(
           padding: const EdgeInsets.all(16.0),
           child: Row(
             children: [
               Expanded(child: dataSource.options.title),
             ],
           ),
         )
         : Divider(),
        (itemList.isNotEmpty)
        ? Column(
          children: itemList,
        )
        : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(child: Text('no Itens found!')),
        ),
      ],
    );
  }

  Widget _buildItens(Map<String, dynamic> value, String labelKey, String valueKey, int dataSourceIndex) {
    return CheckboxListTile(
      value: _selectedValues[dataSourceIndex].contains(value[valueKey]),
      title: Text(value[labelKey].toString()),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(value[valueKey], checked, dataSourceIndex),
    );
  }


  Widget _buildItensWithFilter(Map<String, dynamic> value, String labelKey, String valueKey, int dataSourceIndex) {
     return value[labelKey].toString().toLowerCase().contains(_filterText.toLowerCase()) 
     ? CheckboxListTile(
        value: _selectedValues[dataSourceIndex].contains(value[valueKey]),
        title: Text(value[labelKey].toString()),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (checked) => _onItemCheckedChange(value[valueKey], checked, dataSourceIndex),
      )
     : null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.customizableMultiselectDialogOptions.title ?? ''),
      contentPadding: EdgeInsets.all(0),
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.customizableMultiselectDialogOptions.enableSearchBar) 
              _searchBar(),
            Expanded(
              child: SingleChildScrollView(
                child: ListTileTheme(
                  contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
                  child: ListBody(
                    children: widget.dataSourceList.mapIndex((DataSource dataSource, int index) =>
                      _buildDataSourceTiles(
                        dataSource,
                        index,
                        (_filterText == null || _filterText == "") ? _buildItens : _buildItensWithFilter
                      )
                    ).toList()
                )
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(widget.customizableMultiselectDialogOptions.cancelButtonLabel),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text(widget.customizableMultiselectDialogOptions.okButtonLabel),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }
}
