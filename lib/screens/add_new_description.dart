import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_project/models/todos_changenotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewDescription extends StatefulWidget {
  const AddNewDescription({Key? key}) : super(key: key);

  @override
  _AddNewDescriptionState createState() => _AddNewDescriptionState();
}
class _AddNewDescriptionState extends State<AddNewDescription> {

  late String _txtdescription;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildDescription(id) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        //controller: descInputController,
        decoration: InputDecoration(
            hintText: 'Add description',
            border: InputBorder.none),
        cursorColor: Colors.red[900],
        style: TextStyle(fontSize: 30.0, height: 1.1, color: Colors.white),
        keyboardType: TextInputType.text,
        validator: (value){
          if(value!.isEmpty){
            return null;
          }
          return null;
          },
        onSaved: (value) async{
          _txtdescription = value.toString();
          if (value!.isNotEmpty) {
            FirebaseFirestore.instance
                .collection("tasks")
                .doc(id)
                .collection('subtitle')
                .add({
              "description": _txtdescription,
            }).then((response) {
              Future.delayed(Duration(milliseconds: 200), () {
                context.read<TodoChangeNotifier>().getRecords();
              });
            }).catchError((error) => print(error));
          }
        },
        onFieldSubmitted: (_) async{
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
    String id = context.read<TodoChangeNotifier>().uid;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(preferredSize: Size.fromHeight(20.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text("Description", style: TextStyle(fontSize: 15, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
      ),
      body: Container(color: Colors.cyan[600],
        height: 70,
        child: Form(
          key: _formkey,
          child: _buildDescription(id),
        ),
      ),
    );
  }
}
