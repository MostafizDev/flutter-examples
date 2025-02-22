/// Packages import
import 'package:flutter/material.dart';
import 'package:flutter_examples/samples/datagrid/datagridsource/orderinfo_datagridsource.dart';

/// DataGrid import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Local import
import '../../../model/sample_view.dart';

/// Renders Load More Infinite Scrolling Data Grid
class LoadMoreInfiniteScrollingDataGrid extends SampleView {
  /// Creates Load More Infinite Scrolling Data Grid
  const LoadMoreInfiniteScrollingDataGrid({Key? key}) : super(key: key);

  @override
  _LoadMoreInfiniteScrollingDataGridState createState() =>
      _LoadMoreInfiniteScrollingDataGridState();
}

class _LoadMoreInfiniteScrollingDataGridState extends SampleViewState {
  /// DataGridSource required for SfDataGrid to obtain the row data.
  late OrderInfoDataGridSource employeeDataSource;

  late bool isWebOrDesktop;

  /// Building the progress indicator when DataGrid scroller reach the bottom
  Widget _buildProgressIndicator() {
    final bool isLight =
        model.themeData.colorScheme.brightness == Brightness.light;
    return Container(
        height: 60.0,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            color: isLight ? const Color(0xFFFFFFFF) : const Color(0xFF212121),
            border: BorderDirectional(
                top: BorderSide(
                    width: 1.0,
                    color: isLight
                        ? const Color.fromRGBO(0, 0, 0, 0.26)
                        : const Color.fromRGBO(255, 255, 255, 0.26)))),
        child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color?>(model.backgroundColor),
              backgroundColor: Colors.transparent,
            )));
  }

  /// Callback method for load more builder
  Widget _buildLoadMoreView(BuildContext context, LoadMoreRows loadMoreRows) {
    Future<String> loadRows() async {
      // Call the loadMoreRows function to call the
      // DataGridSource.handleLoadMoreRows method. So, additional
      // rows can be added from handleLoadMoreRows method.
      await loadMoreRows();
      return Future<String>.value('Completed');
    }

    return FutureBuilder<String>(
      initialData: 'Loading',
      future: loadRows(),
      builder: (BuildContext context, AsyncSnapshot<String> snapShot) {
        return snapShot.data == 'Loading'
            ? _buildProgressIndicator()
            : SizedBox.fromSize(size: Size.zero);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
        source: employeeDataSource,
        loadMoreViewBuilder: _buildLoadMoreView,
        columns: _getColumns());
  }

  @override
  void initState() {
    super.initState();
    isWebOrDesktop = model.isWeb || model.isDesktop;
    employeeDataSource =
        OrderInfoDataGridSource(isWebOrDesktop: true, orderDataCount: 25);
  }

  List<GridColumn> _getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'id',
          width:
              (isWebOrDesktop && model.isMobileResolution) ? 120 : double.nan,
          columnWidthMode:
              !isWebOrDesktop ? ColumnWidthMode.none : ColumnWidthMode.fill,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerRight,
              child: const Text(
                'Order ID',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'customerId',
          columnWidthMode:
              !isWebOrDesktop ? ColumnWidthMode.none : ColumnWidthMode.fill,
          width: !isWebOrDesktop
              ? 120
              : (isWebOrDesktop && model.isMobileResolution)
                  ? 150
                  : double.nan,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerRight,
              child: const Text(
                'Customer ID',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'name',
          width:
              (isWebOrDesktop && model.isMobileResolution) ? 120 : double.nan,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Name',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          width:
              (isWebOrDesktop && model.isMobileResolution) ? 110 : double.nan,
          columnName: 'freight',
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerRight,
              child: const Text(
                'Freight',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'city',
          width:
              (isWebOrDesktop && model.isMobileResolution) ? 120 : double.nan,
          columnWidthMode:
              !isWebOrDesktop ? ColumnWidthMode.none : ColumnWidthMode.fill,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: const Text(
                'City',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          width:
              (isWebOrDesktop && model.isMobileResolution) ? 120 : double.nan,
          columnName: 'price',
          columnWidthMode: ColumnWidthMode.lastColumnFill,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerRight,
              child: const Text(
                'Price',
                overflow: TextOverflow.ellipsis,
              )))
    ];
  }
}
