import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: Colors.blueGrey),
  );
}
