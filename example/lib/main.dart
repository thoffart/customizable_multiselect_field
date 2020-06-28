import 'package:customizable_multiselect_field/customizable_multiselect_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Customizable MultiselectField'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final fruitListValue = [
    'test1',
    'test2',
  ];
  final beefListValue = [1, 2, 3];
  final List<int> sectorWithoutFoodListValue = [];
  final vegetablesListValue = ['Broccoli'];
  final noTitleListValue = ['No title'];
  List<List<dynamic>> valueList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomizableMultiselectField(
                  customizableMultiselectWidgetOptions: CustomizableMultiselectWidgetOptions(
                    hintText: Text('Please Select a value', style: TextStyle(color: Colors.grey)),
                    decoration: InputDecoration(
                      labelText: 'Multiselect Sample teste',
                    ),
                    chipShape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(40.0),
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
                        {
                          'number': 'Neck Steak',
                          'value': 3,
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
                        {
                          'number': 3,
                          'value': 3,
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
                        {
                          'key': 'Cauliflower',
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
              ),
              SizedBox(height: 16,),
              RaisedButton(
                onPressed: () {
                  if(_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
                child: Text('Save'),
              ),
              SizedBox(height: 16),
              Text(valueList.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
