/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../model/sample_view.dart';

/// Renders the Spline chart with multilevel labels in x axis.
class MultiLevelLabelsSample extends SampleView {
  ///  Creates the Spline chart with multilevel labels in x axis.
  const MultiLevelLabelsSample(Key key) : super(key: key);

  @override
  _MultiLevelLabelsSampleState createState() => _MultiLevelLabelsSampleState();
}

/// State class of the Spline chart with multilevel labels in x axis.
class _MultiLevelLabelsSampleState extends SampleViewState {
  _MultiLevelLabelsSampleState();
  List<ChartSampleData> _chartData = <ChartSampleData>[];
  List<CategoricalMultiLevelLabel> _xAxisCategories =
      <CategoricalMultiLevelLabel>[];
  late List<String>? _multilevelBorderTypes;
  late MultiLevelBorderType? _selectedMultilevelBorderType;
  late String? _selectedBorderType;
  late bool? _isAxisBorderEnabled;

  @override
  void initState() {
    _chartData = <ChartSampleData>[
      ChartSampleData(x: 'Dec', low: 18.5, high: 24.9),
      ChartSampleData(x: 'Jan', low: 20.2, high: 26.1),
      ChartSampleData(x: 'Feb', low: 20.1, high: 25.5),
      ChartSampleData(x: 'Mar', low: 18.8, high: 24.2),
      ChartSampleData(x: 'Apr', low: 16, high: 21.8),
      ChartSampleData(x: 'May', low: 12.7, high: 19.2),
      ChartSampleData(x: 'Jun', low: 10.9, high: 16.8),
      ChartSampleData(x: 'Jul', low: 9.6, high: 16.4),
      ChartSampleData(x: 'Aug', low: 10, high: 17.5),
      ChartSampleData(x: 'Sep', low: 12.4, high: 20),
      ChartSampleData(x: 'Oct', low: 14.6, high: 21.9),
      ChartSampleData(x: 'Nov', low: 16.7, high: 23.2)
    ];
    _xAxisCategories = <CategoricalMultiLevelLabel>[
      const CategoricalMultiLevelLabel(
          start: 'Dec', end: 'Feb', text: 'Summer'),
      const CategoricalMultiLevelLabel(
          start: 'Mar', end: 'May', text: 'Autumn'),
      const CategoricalMultiLevelLabel(
          start: 'Jun', end: 'Aug', text: 'Winter'),
      const CategoricalMultiLevelLabel(
          start: 'Sep', end: 'Nov', text: 'Spring'),
      const CategoricalMultiLevelLabel(
          start: 'Dec', end: 'Nov', text: 'Year - 2020', level: 1)
    ];
    _multilevelBorderTypes = <String>[
      'rectangle',
      'withoutTopAndBottom',
      'squareBrace',
      'curlyBrace'
    ];
    _selectedMultilevelBorderType = MultiLevelBorderType.rectangle;
    _selectedBorderType = 'rectangle';
    _isAxisBorderEnabled = true;
    super.initState();
  }

  @override
  Widget buildSettings(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return model.isWebFullView
          ? ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Row(children: <Widget>[
                    Text('Border type',
                        style:
                            TextStyle(fontSize: 16.0, color: model.textColor))
                  ]),
                ),
                Container(
                  height: 35,
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      DropdownButton<String>(
                          underline: Container(
                              color: const Color(0xFFBDBDBD), height: 1),
                          value: _selectedBorderType,
                          items: _multilevelBorderTypes!.map((String value) {
                            return DropdownMenuItem<String>(
                                value: (value != null) ? value : 'X',
                                child: Text(value,
                                    style: TextStyle(color: model.textColor)));
                          }).toList(),
                          onChanged: (dynamic value) {
                            _onMultilevelBorderTypeChanged(value.toString());
                            stateSetter(() {});
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Text('Axis label border',
                          style:
                              TextStyle(color: model.textColor, fontSize: 16)),
                      SizedBox(
                          width: 75,
                          child: CheckboxListTile(
                              activeColor: model.backgroundColor,
                              value: _isAxisBorderEnabled,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isAxisBorderEnabled = value;
                                  stateSetter(() {});
                                });
                              })),
                    ],
                  ),
                ),
              ],
            )
          : ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Row(children: <Widget>[
                    Text('Border type   ',
                        style:
                            TextStyle(fontSize: 16.0, color: model.textColor)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: DropdownButton<String>(
                          underline: Container(
                              color: const Color(0xFFBDBDBD), height: 1),
                          value: _selectedBorderType,
                          items: _multilevelBorderTypes!.map((String value) {
                            return DropdownMenuItem<String>(
                                value: (value != null) ? value : 'X',
                                child: Text(value,
                                    style: TextStyle(color: model.textColor)));
                          }).toList(),
                          onChanged: (dynamic value) {
                            _onMultilevelBorderTypeChanged(value.toString());
                            stateSetter(() {});
                          }),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Text('Axis label \nborder',
                          style:
                              TextStyle(color: model.textColor, fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: SizedBox(
                            width: 75,
                            // padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: CheckboxListTile(
                                activeColor: model.backgroundColor,
                                value: _isAxisBorderEnabled,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isAxisBorderEnabled = value;
                                    stateSetter(() {});
                                  });
                                })),
                      ),
                    ],
                  ),
                ),
              ],
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(isVisible: !isCardView),
      title: ChartTitle(
        text: isCardView ? '' : 'Average high/low temperature of Sydney',
      ),
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
          interval: 1,
          labelRotation: model.isMobile ? -90 : 0,
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines:
              MajorTickLines(size: _isAxisBorderEnabled == true ? 0 : 5),
          borderWidth: _isAxisBorderEnabled == true ? 1 : 0,
          axisLine: const AxisLine(width: 0),
          multiLevelLabelStyle: MultiLevelLabelStyle(
              borderWidth: 1, borderType: _selectedMultilevelBorderType!),
          multiLevelLabels: _xAxisCategories),
      primaryYAxis: NumericAxis(
        minimum: 5,
        maximum: 30,
        interval: 5,
        axisLine: const AxisLine(width: 0),
        labelFormat: '{value}°C',
        majorTickLines: const MajorTickLines(size: 0),
      ),
      series: _getDefaultDateTimeSeries(),
      tooltipBehavior:
          TooltipBehavior(enable: true, format: 'point.x : point.y'),
    );
  }

  /// Returns the Spline chart.
  List<SplineSeries<ChartSampleData, String>> _getDefaultDateTimeSeries() {
    return <SplineSeries<ChartSampleData, String>>[
      SplineSeries<ChartSampleData, String>(
        dataSource: _chartData,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.high,
        name: 'High',
        markerSettings: const MarkerSettings(isVisible: true),
      ),
      SplineSeries<ChartSampleData, String>(
        dataSource: _chartData,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.low,
        name: 'Low',
        markerSettings: const MarkerSettings(isVisible: true),
      ),
    ];
  }

  /// Method for updating the multi-level axis label borde type on change.
  void _onMultilevelBorderTypeChanged(String item) {
    _selectedBorderType = item;
    if (_selectedBorderType == 'rectangle') {
      _selectedMultilevelBorderType = MultiLevelBorderType.rectangle;
    } else if (_selectedBorderType == 'withoutTopAndBottom') {
      _selectedMultilevelBorderType = MultiLevelBorderType.withoutTopAndBottom;
    } else if (_selectedBorderType == 'squareBrace') {
      _selectedMultilevelBorderType = MultiLevelBorderType.squareBrace;
    } else if (_selectedBorderType == 'curlyBrace') {
      _selectedMultilevelBorderType = MultiLevelBorderType.curlyBrace;
    }
    setState(() {
      /// update the multi-level border type changes
    });
  }

  @override
  void dispose() {
    _chartData.clear();
    _xAxisCategories.clear();
    super.dispose();
  }
}
