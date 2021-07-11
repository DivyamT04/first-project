import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  var list;
  var index;
  Description( {Key? key, QueryDocumentSnapshot<Object?>? this.list, int? this.index}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {

  get index => widget.index;
  @override
  void initState() {
    print(widget.list.data.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
    );
  }
}
