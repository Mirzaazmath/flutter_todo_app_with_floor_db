import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(var msg) {
  Fluttertoast.showToast(
      msg: msg,
      fontSize: 18,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.grey[200],
      textColor: Colors.black);
}