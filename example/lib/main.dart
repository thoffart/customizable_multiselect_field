import 'package:customizable_multiselect_flutter/customizable_multiselect_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
                dataSource: [
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
                    options: DataSourceOptions(valueKey: 'value', labelKey: 'label', title: 'label1'),
                    valueList: ['test1', 'test2', 'test3', 'test4', 'test5', 'test6'],
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
                    options: DataSourceOptions(valueKey: 'value', labelKey: 'number', title: 'label2'),
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
                    options: DataSourceOptions(valueKey: 'value', labelKey: 'number', title: 'number3'),
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
                    options: DataSourceOptions(valueKey: 'key', labelKey: 'key', title: 'number4'),
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
