import 'package:customizable_multiselect_flutter/customizable_multiselect_flutter.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomizableMultiselectField(
                dataSourceList: [
                  DataSource<String>(
                    dataList: [
                      {
                        'label': 'label1',
                        'value': 'test1',
                      },
                      {
                        'label': 'label2',
                        'value': 'test2',
                      },
                      {
                        'label': 'label3',
                        'value': 'test3',
                      },
                      {
                        'label': 'label4',
                        'value': 'test4',
                      },
                      {
                        'label': 'label5',
                        'value': 'test5',
                      },
                      {
                        'label': 'label6',
                        'value': 'test6',
                      },
                    ],
                    options: DataSourceOptions(
                        valueKey: 'value', labelKey: 'label', title: 'label1'),
                    valueList: [
                      'test1',
                      'test2',
                      'test3',
                      'test4',
                      'test5',
                      'test6'
                    ],
                  ),
                  DataSource(
                    dataList: [
                      {
                        'number': 'number1',
                        'value': 1,
                      },
                      {
                        'number': 'number2',
                        'value': 2,
                      },
                      {
                        'number': 'number3',
                        'value': 3,
                      },
                    ],
                    options: DataSourceOptions(
                        valueKey: 'value', labelKey: 'number', title: 'label2'),
                    valueList: [1, 2, 3],
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
                    options: DataSourceOptions(
                        valueKey: 'value',
                        labelKey: 'number',
                        title: 'number3'),
                    valueList: [],
                  ),
                  DataSource<String>(
                    dataList: [
                      {
                        'key': 'key1',
                      },
                      {
                        'key': 'key2',
                      },
                      {
                        'key': 'key3',
                      },
                    ],
                    options: DataSourceOptions(
                        valueKey: 'key', labelKey: 'key', title: 'number4'),
                    valueList: ['key1'],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
