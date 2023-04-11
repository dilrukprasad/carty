import 'package:flutter/material.dart';

class AppStyles {
  TextStyle f20w5cw = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  TextStyle f16w3 = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );

  TextStyle f18w5 = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  TextStyle f18w5cw = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: Colors.white,
  );

  TextStyle f12w4 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  ButtonStyle bStyleFull = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[300],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    elevation: 0.0,
  );

  ButtonStyle bStyleBorder = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
      side: BorderSide(
        width: 5.0,
        color: Colors.blue[300]!,
      ),
    ),
    elevation: 0.0,
  );
}
