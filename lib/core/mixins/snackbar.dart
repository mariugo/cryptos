import 'package:flutter/material.dart';

mixin MySnackBar<T extends StatefulWidget> on State<T> {
  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(20),
        elevation: 3,
        content: Text(message),
      ),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(20),
        elevation: 3,
        backgroundColor: Colors.red[900],
        content: Text(message),
      ),
    );
  }

  void showInfo(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(20),
        elevation: 3,
        backgroundColor: Colors.blue,
        content: Text(message),
      ),
    );
  }
}
