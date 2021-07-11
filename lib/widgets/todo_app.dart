import 'package:flutter/material.dart';
import 'package:todos_project/models/todos_changenotifier.dart';
import 'package:todos_project/screens/add_new_title.dart';
import 'package:todos_project/screens/menu_screen.dart';
import 'package:todos_project/widgets/todo_list_with_listviewbuilder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatefulWidget {

  @override
  _TodoAppState createState() => _TodoAppState();
}
class _TodoAppState extends State<TodoApp> {
  var firestoreDB = FirebaseFirestore.instance.collection("todos").snapshots();
  late TextEditingController taskInputController;

  @override
  void initState() {
    super.initState();
    taskInputController = TextEditingController();
    Future.delayed(Duration.zero, () {
      context.read<TodoChangeNotifier>().getTODO();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen())
          );
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(preferredSize: Size.fromHeight(20.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              title: Text("My List", style: TextStyle(fontSize: 15, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold),),
              centerTitle: true,
            ),
          ),
          body: TodoListwithListViewBuilder(),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.cyan[800],
              onPressed: (){
                navigateToAddTitle(context);
              },
              child: Icon(Icons.add)),
        ),
    );
  }

  Future navigateToAddTitle(BuildContext context) async{
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewTitle(),
      ),
    );
  }
}
