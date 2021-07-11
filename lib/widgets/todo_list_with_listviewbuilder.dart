import 'package:todos_project/widgets/todo_description.dart';
import 'package:todos_project/models/todos_changenotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListwithListViewBuilder extends StatefulWidget {
  const TodoListwithListViewBuilder({Key? key}) : super(key: key);

  @override
  _TodoListwithListViewBuilderState createState() => _TodoListwithListViewBuilderState();
}

class _TodoListwithListViewBuilderState extends State<TodoListwithListViewBuilder> {

  var firestoreDB = FirebaseFirestore.instance.collection("tasks").snapshots();
  late TextEditingController taskInputController;

  Widget slideRightBackground() {
    return Container(
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 30,
            ),
            Icon(
              Icons.check,
              color: Colors.lightGreenAccent,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
  Widget slideLeftBackground() {
    return Container(
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoChangeNotifier>(
      builder: (context, todolistCNIntance, _) =>todolistCNIntance.title.isNotEmpty ? ListView.builder(
          itemCount: todolistCNIntance.title.length,
          itemBuilder: (context, int index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction){
                switch (direction){
                  case DismissDirection.endToStart:
                    // Utils.showSnackBar(
                    //     context, 'Task has been deleted');
                    var docId = todolistCNIntance.docID[index];
                    FirebaseFirestore.instance
                        .collection("tasks")
                        .doc(docId)
                        .delete();
                    break;
                  case DismissDirection.startToEnd:
                    var docId = todolistCNIntance.docID[index];
                    FirebaseFirestore.instance
                        .collection("tasks")
                        .doc(docId)
                        .delete();
                    // Utils.showSnackBar(
                    //     context, 'Chat has been Completed');
                    break;
                  default:
                    break;
                }
              },
              background: slideRightBackground(),
              secondaryBackground: slideLeftBackground(),
              child: Card(
                elevation: 0,
                child: Container(
                  height: 70.0,
                  child: ListTile(
                    key: Key(index.toString()),
                    onTap: () {
                      var po = Provider.of<TodoChangeNotifier>(context, listen: false);
                      po.uidSetter(todolistCNIntance.docID[index]);
                      navigateTodoDescription(
                        todolistCNIntance.title[index]
                      );
                    },
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 16.0),
                    tileColor: Colors.cyan[600],
                    title: Text(
                      todolistCNIntance.title[index],
                      style: TextStyle(fontSize: 27.0, color: Colors.white),
                    ),
                    trailing: Container(
                      child: Text(
                        "${todolistCNIntance.lenthIndex[index]}",
                        style: TextStyle(fontSize: 27.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),);
          }
      ): Text("No Todo"),
    );
  }
  navigateTodoDescription(String post) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TodoDescription(post: post)
      ),
    );
  }
}
