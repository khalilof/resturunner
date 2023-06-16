import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturunner/model/table_details.dart';
import 'package:resturunner/model/table_status.dart';
import 'package:resturunner/model/tables_provider.dart';

class TableCard extends StatelessWidget {
  final TableDetails table;
  const TableCard({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5.0),
                //color: getColorByStatus(table.status),
                decoration: BoxDecoration(
                  color: getColorByStatus(table.status),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Table #${table.tableId}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      table.status.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Consumer<TablesProvider>(
                builder: (context, tablesProvider, child) {
                  final currentStatus = table.status;
                  TableStatus nextStatus;
                  String nextStatusText;

                  switch (currentStatus) {
                    case TableStatus.ready:
                      nextStatus = TableStatus.ordering;
                      nextStatusText = 'Change to Ordering';
                      break;
                    case TableStatus.ordering:
                      nextStatus = TableStatus.ordered;
                      nextStatusText = 'Change to Ordered';
                      break;
                    case TableStatus.ordered:
                      nextStatus = TableStatus.finished;
                      nextStatusText = 'Change to Finished';
                      break;
                    case TableStatus.finished:
                      nextStatus = TableStatus.paid;
                      nextStatusText = 'Change to Paid';
                      break;
                    case TableStatus.paid:
                      nextStatus = TableStatus.cleaning;
                      nextStatusText = 'Change to Cleaning';
                      break;
                    case TableStatus.cleaning:
                      nextStatus = TableStatus.ready;
                      nextStatusText = 'Change to Ready';
                      break;
                  }

                  return ElevatedButton(
                    child: Text(nextStatusText),
                    onPressed: () {
                      tablesProvider.updateTableStatus(table, nextStatus);
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }

  getColorByStatus(TableStatus status) {
    switch (status) {
      case TableStatus.cleaning:
        return Colors.blueGrey.shade300;
      case TableStatus.finished:
        return Colors.greenAccent.shade400;
      case TableStatus.ordered:
        return Colors.orange;
      case TableStatus.ordering:
        return Colors.yellow;
      case TableStatus.paid:
        return Colors.lightGreen;
      case TableStatus.ready:
        return Colors.blue.shade300;
    }
  }
}
