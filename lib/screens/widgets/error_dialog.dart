import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showError(BuildContext context, String errorMessage) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Please Enter Correct Values'),
          content: Text(errorMessage),
          actions: <Widget>[
            MaterialButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      });
}
