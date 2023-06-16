import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturunner/model/tables_provider.dart';
import 'package:resturunner/widgets/table_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TablesProvider>(builder: (context, tablesProvider, child) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3,
        ),
        itemCount: tablesProvider.tables.length,
        itemBuilder: (context, index) {
          return TableCard(table: tablesProvider.tables[index]);
        },
      );
    });
  }
}
