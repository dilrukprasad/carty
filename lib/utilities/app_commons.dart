import 'package:flutter/material.dart';

SnackBar commonSnackBar(String text) => SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'Done',
        onPressed: () {},
      ),
    );

ElevatedButton eButton(
        {Function()? onPressed, ButtonStyle? style, String? text}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: style,
      // AppStyles().bStyleFull,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          text!,
          // 'Buy Now',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
