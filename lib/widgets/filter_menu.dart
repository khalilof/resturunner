import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:resturunner/model/table_status.dart';
import 'package:resturunner/model/tables_provider.dart';

class FilterMenu extends StatelessWidget {
  const FilterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TablesProvider>(
      builder: (context, tablesProvider, child) {
        return SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.checklist),
              onTap: () => tablesProvider.filterByStatus(TableStatus.ordering),
            ),
            SpeedDialChild(
              child: const Icon(Icons.hourglass_bottom),
              onTap: () => tablesProvider.filterByStatus(TableStatus.ordered),
            ),
            SpeedDialChild(
              child: const Icon(Icons.check),
              onTap: () => tablesProvider.filterByStatus(TableStatus.ready),
            ),
            SpeedDialChild(
              child: const Icon(Icons.paid),
              onTap: () => tablesProvider.filterByStatus(TableStatus.paid),
            ),
            SpeedDialChild(
              child: const Icon(Icons.restaurant),
              onTap: () => tablesProvider.filterByStatus(TableStatus.finished),
            ),
            SpeedDialChild(
              child: const Icon(Icons.cleaning_services),
              onTap: () => tablesProvider.filterByStatus(TableStatus.cleaning),
            ),
            SpeedDialChild(
              child: const Icon(Icons.filter_alt_off),
              onTap: () => tablesProvider.filterByStatus(null),
            ),
          ],
        );
      },
    );
  }
}
