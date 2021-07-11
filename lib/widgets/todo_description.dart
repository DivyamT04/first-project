import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_project/models/todos_changenotifier.dart';
import 'package:todos_project/screens/add_new_description.dart';
import 'package:todos_project/widgets/todo_app.dart';
import 'package:todos_project/widgets/todo_description_with_listviewbuilder.dart';

class TodoDescription extends StatefulWidget {
  final String post;
  const TodoDescription({required this.post});

  @override
  _TodoDescriptionState createState() => _TodoDescriptionState();
}

class _TodoDescriptionState extends State<TodoDescription> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<TodoChangeNotifier>().getRecords();
    });
  }
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TodoApp())
          );
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(preferredSize: Size.fromHeight(20.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              title: Text(widget.post, style: TextStyle(fontSize: 15, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold),),
              centerTitle: true,
            ),
          ),
          body: TodoDescriptionListViewBuilder(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan[800],
            onPressed: (){
              navigateToAddDescription(context);
            },
            child: Icon(Icons.add),
          ),
        ),
    );
  }

  Future navigateToAddDescription(BuildContext context) async{
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewDescription(),
      ),
    );
  }
}
