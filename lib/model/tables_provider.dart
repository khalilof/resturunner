import 'package:flutter/material.dart';
import 'package:resturunner/model/table_details.dart';
import 'package:resturunner/model/table_status.dart';

class TablesProvider extends ChangeNotifier {
  final List<TableDetails> _tables = List<TableDetails>.generate(10,
      (index) => TableDetails(tableId: index + 1, status: TableStatus.ready));
  TableStatus? _filterStatus;

  List<TableDetails> get tables => _filterStatus == null
      ? _tables
      : _tables.where((it) => it.status == _filterStatus).toList();

  void updateTableStatus(TableDetails table, TableStatus newStatus) {
    int tableIndex = _tables.indexOf(table);
    if (tableIndex != -1) {
      _tables[tableIndex] = TableDetails(
        tableId: table.tableId,
        status: newStatus,
      );
      notifyListeners();
    }
  }

  void filterByStatus(TableStatus? status) {
    _filterStatus = status;
    notifyListeners();
  }
}
