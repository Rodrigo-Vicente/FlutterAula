import 'package:flutter/material.dart';

void alert(context, String title) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    )
  );
}