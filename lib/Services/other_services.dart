import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/Preferances.dart';
import '../utils/constants.dart';

getheader() async {
  final sessionid = await PreferenceService().getString("token");
  print(sessionid);
  String Token="Bearer ${sessionid}";
  Map<String, String> a = {authorization: Token.toString(),'Content-Type': 'application/json; charset=UTF-8'};
  return a;
}

getheader1() async {
  final sessionid = await PreferenceService().getString("token");
  String Token="Bearer ${sessionid}";
  Map<String, String> a = {authorization: Token.toString(),'Content-Type':'multipart/form-data;'};
  return a;
}

getheader2() async {
  final sessionid = await PreferenceService().getString("token");
  print(sessionid);
  String Token="Bearer ${sessionid}";
  Map<String, String> a = {authorization: Token.toString(), 'accept': 'application/json',};
  return a;
}

getheader3() async {
  final sessionid = await PreferenceService().getString("token");
  String Token="Bearer ${sessionid}";
  Map<String, String> a = {'accept': 'application/json',authorization: Token.toString(),'Content-Type': 'application/x-www-form-urlencoded'};
  return a;
}

getheader4() async {
  final sessionid = await PreferenceService().getString("token");
  String Token="Bearer ${sessionid}";
  Map<String, String> a = {'accept': 'application/json',authorization: Token.toString(), 'Content-Type': 'application/json',};
  return a;
}


class AadhaarNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Implement formatting logic here
    if (newValue.text.length > 12) {
      return oldValue; // Prevents entering more than 12 characters
    }

    var newText = newValue.text;

    // Insert space after every 4 characters if necessary
    if (newValue.text.isNotEmpty &&
        newValue.text.length > oldValue.text.length &&
        (newValue.text.length == 5 ||
            newValue.text.length == 10)) {
      newText += ' ';
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

void Flashbar(BuildContext context, String text, String type) {
  Flushbar(
    barBlur: 10,
    isDismissible: true,
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: (type == "")
        ? "Only ${text} unit(s) can be added per order"
        : "${text}",
    titleColor: Colors.black,
    messageColor: Colors.black,
    dismissDirection: FlushbarDismissDirection.VERTICAL,
    flushbarStyle: FlushbarStyle.FLOATING,
    shouldIconPulse: false,
    backgroundColor: Color(0xFFCDE2FB),
    duration: Duration(seconds: 3),
  )..show(context);
}


class NoInternetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/nointernet.png",
              width: 47,
              height: 47,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Text(
                "Connect to the Internet",
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Text(
                "You are Offline. Please Check Your Connection",
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            GestureDetector(
              onTap: () {
                (context as Element).reassemble();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 38),
                child: Container(
                  width: 240,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF2DB3FF),
                  ),
                  child: const Center(
                    child: Text(
                      "Retry",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Verhoeff {
  // Multiplication table
  static final List<List<int>> d = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
    [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
    [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
    [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
    [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
    [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
    [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
    [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  ];

  // Permutation table
  static final List<List<int>> p = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
    [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
    [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
    [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
    [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
    [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
    [7, 0, 4, 6, 9, 1, 3, 2, 5, 8]
  ];

  // Inverse table
  static final List<int> inv = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9];

  // Validates if the Aadhaar number is valid
  static bool isValid(String aadhaar) {
    if (aadhaar.length != 12) {
      throw FormatException('Aadhaar numbers should be 12 digits in length');
    }
    if (!RegExp(r'^\d+$').hasMatch(aadhaar)) {
      throw FormatException('Aadhaar numbers must contain only numbers');
    }

    final List<int> digits = aadhaar.split('').map(int.parse).toList();
    final int checksum = digits.removeLast();

    return generate(digits) == checksum;
  }

  // Generates the checksum using Verhoeff algorithm
  static int generate(List<int> digits) {
    int c = 0;
    List<int> reversedDigits = List.from(digits.reversed);
    for (int i = 0; i < reversedDigits.length; i++) {
      c = d[c][p[(i + 1) % 8][reversedDigits[i]]];
    }
    return inv[c];
  }
}

