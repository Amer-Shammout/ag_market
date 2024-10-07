import 'dart:developer';

import 'package:ag_market/constants.dart';
import 'package:ag_market/views/tabs_view.dart';
import 'package:flutter/material.dart';

void showSnackBar(String message, VoidCallback onPressed) {
  try {
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: "Undo",
          onPressed: onPressed,
          textColor: kPrimaryColor,
        ),
        backgroundColor: Colors.grey.shade200,
        padding: EdgeInsets.zero,
        content: Row(
          children: [
            Container(
              height: 60,
              width: 6,
              color: Colors.green,
            ),
            const Flexible(
              child: SizedBox(
                width: 8,
              ),
            ),
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
            ),
            const Flexible(
              child: SizedBox(
                width: 8,
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                textAlign: TextAlign.center,
                message,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } on Exception catch (e) {
    log(e.toString());
  }
}
