# customizable_multiselect_field

A Flutter package that provides a highly customizable multiselect field.

* Supports multiples data sources with customs label keys and value keys. 
* Includes custumization through the classes `CustomizableMultiselectWidgetOptions`, `CustomizableMultiselectDialogOptions` and  `DataSourceOptions`.
* It's a `FormField` and contains the default properties of one (`onSaved`, `validator`, `autovalidate` and `onChanged`).

<img src="https://github.com/thoffart/customizable_multiselect_field/raw/master/customizable_multiselect_field_sample.gif" width="300" />


## Usage

- Add the package into your dependencies in `pubspec.yaml`:

```yaml
dependencies:
  customizable_multiselect_field: 0.0.4
```

- Import in your code:

```dart
import 'package:customizable_multiselect_field/customizable_multiselect_flutter.dart';
```


## Example


```dart
CustomizableMultiselectField(
    customizableMultiselectWidgetOptions: CustomizableMultiselectWidgetOptions(
    hintText: Text('Please Select a value', style: TextStyle(color: Colors.grey)),
    decoration: InputDecoration(
        labelText: 'Multiselect Sample teste',
    ),
    chipShape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(16.0),
    ),
    ),
    customizableMultiselectDialogOptions: CustomizableMultiselectDialogOptions(),
    dataSourceList: [
    DataSource<String>(
        dataList: [
        {
            'label': 'Lime',
            'value': 'test1',
        },
        {
            'label': 'Apple',
            'value': 'test2',
        },
        ],
        valueList: fruitListValue,
        options: DataSourceOptions(valueKey: 'value', labelKey: 'label', title: Text('Fruits', style: TextStyle(color: Colors.red), textAlign: TextAlign.start,)),
    ),
    DataSource(
        dataList: [
        {
            'number': 'Chuck',
            'value': 1,
        },
        {
            'number': 'Rump Steak',
            'value': 2,
        },
        ],
        valueList: beefListValue,
        options: DataSourceOptions(valueKey: 'value', labelKey: 'number', title: Text('Beef', style: TextStyle(color: Colors.grey), textAlign: TextAlign.start,)),
    ),
    DataSource<int>(
        dataList: [
        {
            'number': 1,
            'value': 1,
        },
        {
            'number': 2,
            'value': 2,
        },
        ],
        valueList: sectorWithoutFoodListValue,
        options: DataSourceOptions(valueKey: 'value', labelKey: 'number', title: Text('Sectors Without Food', style: TextStyle(color: Colors.brown), textAlign: TextAlign.start,)),
    ),
    DataSource<String>(
        dataList: [
        {
            'key': 'Broccoli',
        },
        {
            'key': 'Cucumber',
        },
        ],
        options: DataSourceOptions(valueKey: 'key', labelKey: 'key', title: Text('Vegetables', style: TextStyle(color: Colors.green), textAlign: TextAlign.start)),
        valueList: vegetablesListValue,
    ),
    DataSource<String>(
        dataList: [
        {
            'key': 'No title',
        },
        ],
        options: DataSourceOptions(valueKey: 'key', labelKey: 'key',),
        valueList: noTitleListValue,
    ),
    ],
    onChanged: ((List<List<dynamic>> value) => print(value)),
    onSaved: ((List<List<dynamic>> newValueList) {
    setState(() {
        valueList = newValueList;
    });
    }),
    validator: ((List<List<dynamic>> value) {
    if(value.every((element) => element.isEmpty))
        return 'Please Select a value!';
    return null;

    })
),

```    

### Contributors

  * [Thiago Hoffart](https://github.com/thoffart)
