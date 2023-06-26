import 'package:flutter/material.dart';

abstract class Show {
  static void error(BuildContext context, String error) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
            content: Text(error),
          ),
        );
    });
  }
}
