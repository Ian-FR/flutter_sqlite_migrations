import 'package:flutter/material.dart';

import 'database/migration_service.dart';
import 'database/migrations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDB(MigrationService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(title: 'Migrations Approach'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Container(
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset('assets/SQLite.png'),
            )),
      ),
    );
  }
}
