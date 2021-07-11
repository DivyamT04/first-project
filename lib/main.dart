import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todos_project/models/todos_changenotifier.dart';
import 'package:todos_project/screens/menu_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TodoChangeNotifier>(create: (_) => TodoChangeNotifier()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    )
  ));
}
