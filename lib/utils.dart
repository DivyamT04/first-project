import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{
  static void showSheet(
      BuildContext context, {
        required Widget child,
        required VoidCallback onClicked,
      }) =>
      showModalBottomSheet(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Done'),
            onPressed: onClicked,
          ),
        ),
      );
}