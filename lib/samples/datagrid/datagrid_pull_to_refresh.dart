/// Package imports
import 'package:flutter/material.dart';

/// DataGrid import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Local import
import '../../../model/sample_view.dart';
import 'datagridsource/orderinfo_datagridsource.dart';

/// Renders pull refresh data grid
class PullToRefreshDataGrid extends SampleView {
  /// Creates pull refresh data grid
  const PullToRefreshDataGrid({Key? key}) : super(key: key);

  @override
  _PullToRefreshDataGridState createState() => _PullToRefreshDataGridState();
}

class _PullToRefreshDataGridState extends SampleViewState {
  /// DataGridSource required for SfDataGrid to obtain the row data.
  late OrderInfoDataGridSource employeeDataSource;

  late bool isWebOrDesktop;

  List<GridColumn> _getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'id',
          width:
              (isWebOrDesktop && model.isMobileResolution) ? 120.0 : double.nan,
          columnWidthMode:
              !isWebOrDesktop ? ColumnWidthMode.none : ColumnWidthMode.fill,
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerRight,
            child: const Text(
              'Order ID',
              overflow: TextOverflow.ellipsis,
            ),
          )),
      GridColumn(
        columnName: 'customerId',
        columnWidthMode:
            !isWebOrDesktop ? ColumnWidthMode.none : ColumnWidthMode.fill,
        width: !isWebOrDesktop
            ? 120
            : (isWebOrDesktop && model.isMobileResolution)
                ? 150.0
                : double.nan,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: const Text(
            'Customer ID',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'name',
        width:
            (isWebOrDesktop && model.isMobileResolution) ? 120.0 : double.nan,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Name',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'freight',
        width:
            (isWebOrDesktop && model.isMobileResolution) ? 110.0 : double.nan,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'Freight',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'city',
        width:
            (isWebOrDesktop && model.isMobileResolution) ? 120.0 : double.nan,
        columnWidthMode:
            !isWebOrDesktop ? ColumnWidthMode.none : ColumnWidthMode.fill,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'City',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'price',
        width:
            (isWebOrDesktop && model.isMobileResolution) ? 120.0 : double.nan,
        columnWidthMode: ColumnWidthMode.lastColumnFill,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: const Text(
            'Price',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    isWebOrDesktop = model.isWeb || model.isDesktop;
    employeeDataSource =
        OrderInfoDataGridSource(isWebOrDesktop: true, orderDataCount: 25);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          brightness: model.themeData.colorScheme.brightness,
          colorScheme:
              model.themeData.colorScheme.brightness == Brightness.light
                  ? ColorScheme.light(primary: model.backgroundColor)
                  : ColorScheme.dark(primary: model.backgroundColor),
        ),
        child: SfDataGrid(
            source: employeeDataSource,
            allowPullToRefresh: true,
            columns: _getColumns()));
  }
}
