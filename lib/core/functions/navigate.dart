import 'package:flutter/material.dart';

navigate({
  required BuildContext context,
  required Widget screen,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}
