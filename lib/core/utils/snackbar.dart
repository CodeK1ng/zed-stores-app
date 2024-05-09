import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      backgroundColor: Colors.grey[800],
    ),
  );
}
