import 'dart:math';

import 'package:flutter/material.dart';

List<List<String>> names = [
  ["Niyam Kachhadia"],
  ["Himansu Bajariya"],
  ["Divy Lathiya"],
  ["Dhruv Baldha"],
  ["Taksh Rokad"],
  ["Bhargav Dobariya"],
  ["Guru Vyas"],
  ["Tanveer Rajput"],
  ["Hetav Chovhan"],
  ["Jemin Bhatt"],
  ["Deep Vora"],
  ['Umang Patel'],
];

final Random _random = Random();

Color getRandomColor() {
  final List<Color> colors = [
    Colors.red[100]!,
    Colors.blue[100]!,
    Colors.green[100]!,
    Colors.orange[100]!,
    Colors.purple[100]!,
    Colors.teal[100]!,
    Colors.pink[100]!,
  ];
  return colors[_random.nextInt(colors.length)];
}
