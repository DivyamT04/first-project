import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoChangeNotifier extends ChangeNotifier {

  //title id
  String _uid = '';
  String get uid => _uid;

  void uidSetter(String uId) {
    _list.clear();
    _uid = uId;
    notifyListeners();
  }
  // description id
  String _did = '';
  String get did => _did;

  void didSetter(String dId) {
    _list.clear();
    _did = dId;
    notifyListeners();
  }

  List _list = [];
  List get list => _list;

  void getRecords() async {
    _list.clear();
    FirebaseFirestore.instance
        .collection('tasks')
        .doc(_uid)
        .collection('subtitle')
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          FirebaseFirestore.instance
              .collection('tasks')
              .doc(_uid)
              .collection('subtitle')
              .doc(element.id)
              .get()
              .then((data) {
            if (data.exists) {
              _list.add(data['description']);
              notifyListeners();
            }
          });
        });
      }
    });
  }
  // Get Titles and Length

  List<String> _titles = [];
  List<String> get title => _titles;
  List<int> _lengthIndex = [];
  List<int> get lenthIndex => _lengthIndex;
  List<String> _docID = [];
  List<String> get docID => _docID;

  void getTODO() async {
    _docID.clear();
    _titles.clear();
    _lengthIndex.clear();
    FirebaseFirestore.instance.collection('tasks').get().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          FirebaseFirestore.instance
              .collection('tasks')
              .doc(element.id)
              .collection('subtitle')
              .get()
              .then((data) {
            _docID.add(element.id);
            _titles.add(element['title']);
            _lengthIndex.add(data.docs.length);
            notifyListeners();
          });
        });
      }
    });
  }
}
