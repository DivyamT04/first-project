import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_project/models/todos_changenotifier.dart';
import 'package:todos_project/widgets/todo_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewTitle extends StatefulWidget {
  const AddNewTitle({Key? key}) : super(key: key);

  @override
  _AddNewTitleState createState() => _AddNewTitleState();
}

class _AddNewTitleState extends State<AddNewTitle> {

  var firestoreDB = FirebaseFirestore.instance.collection("todos").snapshots();
  late TextEditingController taskInputController;
  late String _txtTitle;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildTitle(){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Add a title',
          border: InputBorder.none,
        ),
        cursorColor: Colors.red[900],
        style: TextStyle(fontSize: 30.0, height: 1.1, color: Colors.white),
        keyboardType: TextInputType.text,
        validator: (value){
          if(value!.isEmpty){
            return null;
          }
          return null;
        },
        onSaved: (value){
          _txtTitle = value.toString();
          if(value!.isNotEmpty){
          var po = context.read<TodoChangeNotifier>();
          FirebaseFirestore.instance.collection("tasks").add({
          "title": _txtTitle,
          }).then((response) {
          po.getTODO();
          print(response.id);
          taskInputController.clear();
          }).catchError((error) => print(error));
          }
        },
        onFieldSubmitted: (_)async{
          if (!_formkey.currentState!.validate()) {
            return;
          }
          _formkey.currentState!.save();
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        Navigator.pushReplacement(
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
              title: Text("My List", style: TextStyle(fontSize: 15, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold),),
              centerTitle: true,
            ),
          ),
          body: Container(color: Colors.cyan[600],
            height: 70,
            child: Form(
                key: _formkey,
                child: ListView(
                  children: <Widget>[
                    _buildTitle(),
                  ],
                )
            ),
          )
      ),
    );
  }
}
