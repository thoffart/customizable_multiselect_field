import 'package:customizable_multiselect_flutter/customizable_multiselect_flutter.dart';
import 'package:customizable_multiselect_flutter/models/customizable_multiselect_widget_options.dart';
import 'package:customizable_multiselect_flutter/models/data_source.dart';
import 'package:customizable_multiselect_flutter/models/data_source_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fruitListValue = [
    'test1',
    'test2',
  ];
  testWidgets('CustomizableMultiselectField Test', (WidgetTester tester) async {
    final customizableMultiselectWidgetOptions = CustomizableMultiselectWidgetOptions(
      decoration: InputDecoration(
        labelText: 'Multiselect Sample',
      ),
      chipShape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(40.0),
      ),
    );
    final customizableMultiselectDialogOptions = CustomizableMultiselectDialogOptions();
    final dataSourceList = [
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
          {
            'label': 'Cherry',
            'value': 'test3',
          },
        ],
        valueList: fruitListValue,
        options: DataSourceOptions(valueKey: 'value', labelKey: 'label', title: Text('Fruits', style: TextStyle(color: Colors.red), textAlign: TextAlign.start,)),
      ),
    ];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: CustomizableMultiselectField(
              customizableMultiselectWidgetOptions: customizableMultiselectWidgetOptions,
              customizableMultiselectDialogOptions: customizableMultiselectDialogOptions,
              dataSourceList: dataSourceList,
          ),
        ),
      )
    );

    final findChips = find.byType(Chip);

    final chipLimeFinder = find.byWidgetPredicate((Widget widget) =>
      widget is Chip && (widget.label as Text).data == "Lime"
    );

    final chipAppleFinder = find.byWidgetPredicate((Widget widget) =>
      widget is Chip && (widget.label as Text).data == "Apple"
    );

    final chipCherryFinder = find.byWidgetPredicate((Widget widget) =>
      widget is Chip && (widget.label as Text).data == "Cherry"
    );


    expect(findChips, findsNWidgets(2));
    expect(chipLimeFinder, findsOneWidget);
    expect(chipAppleFinder, findsOneWidget);
    expect(chipCherryFinder, findsNothing);

    await tester.tap(
      find.byWidgetPredicate((widget) =>
        widget is InkWell && widget.child is InputDecorator
      )
    );

    await tester.pumpAndSettle();

    final checkboxListTileCherryFinder = find.byWidgetPredicate((widget) => 
      widget is CheckboxListTile && (widget.title as Text).data == 'Cherry'
    );

    final checkboxListTileAppleFinder = find.byWidgetPredicate((widget) => 
      widget is CheckboxListTile && (widget.title as Text).data == 'Apple'
    );

    final checkboxListTileLimeFinder = find.byWidgetPredicate((widget) => 
      widget is CheckboxListTile && (widget.title as Text).data == 'Lime'
    );

    expect(checkboxListTileCherryFinder, findsOneWidget);
    expect(checkboxListTileAppleFinder, findsOneWidget);
    expect(checkboxListTileLimeFinder, findsOneWidget);

    await tester.tap(
      find.byWidgetPredicate((widget) =>
        widget is CheckboxListTile && (widget.title as Text).data == 'Cherry'
      )
    );

    await tester.tap(
      find.byWidgetPredicate((widget) =>
        widget is FlatButton && (widget.child as Text).data == 'Ok'
      )
    );

    await tester.pumpAndSettle();

    expect(chipCherryFinder, findsOneWidget);


    await tester.tap(
      find.byWidgetPredicate((widget) =>
        widget is InkWell && widget.child is InputDecorator
      )
    );

    await tester.pumpAndSettle();


    await tester.tap(
      find.byWidgetPredicate((widget) =>
        widget is CheckboxListTile && (widget.title as Text).data == 'Lime'
      )
    );

    await tester.tap(
      find.byWidgetPredicate((widget) =>
        widget is CheckboxListTile && (widget.title as Text).data == 'Apple'
      )
    );

    await tester.tap(
      find.byWidgetPredicate((widget) =>
        widget is CheckboxListTile && (widget.title as Text).data == 'Cherry'
      )
    );

    await tester.tap(
      find.byWidgetPredicate((widget) =>
        widget is FlatButton && (widget.child as Text).data == 'Ok'
      )
    );

    
    await tester.pumpAndSettle();

    expect(findChips, findsNWidgets(0));
    expect(chipLimeFinder, findsNothing);
    expect(chipAppleFinder, findsNothing);
    expect(chipCherryFinder, findsNothing);

  });
}
