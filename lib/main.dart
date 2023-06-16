import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:resturunner/model/tables_provider.dart';
import 'package:resturunner/views/home.dart';
import 'package:resturunner/widgets/filter_menu.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TablesProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Resturunner"),
        ),
        body: const Home(),
        floatingActionButton: const FilterMenu(),
      ),
    );
  }
}
