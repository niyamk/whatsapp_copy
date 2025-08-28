import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

List<List<String>> names = [
  ["Niyam Kachhadia", loremIpsum(words: 7)],
  ["Himansu Bajariya", loremIpsum(words: 7)],
  ["Divy Lathiya", loremIpsum(words: 7)],
  ["Dhruv Baldha", loremIpsum(words: 7)],
  ["Taksh Rokad", loremIpsum(words: 7)],
  ["Bhargav Dobariya", loremIpsum(words: 7)],
  ["Guru Vyas", loremIpsum(words: 7)],
  ["Tanveer Rajput", loremIpsum(words: 7)],
  ["Hetav Chovhan", loremIpsum(words: 7)],
  ["Jemin Bhatt", loremIpsum(words: 7)],
  ["Deep Vora", loremIpsum(words: 7)],
  ['Umang Patel', loremIpsum(words: 7)],
];

Color getColorFromLetter(String letter) {
  int ascii = letter.codeUnitAt(0);
  List<Color> colors = [
    Colors.red[100]!,
    Colors.blue[100]!,
    Colors.green[100]!,
    Colors.orange[100]!,
    Colors.purple[100]!,
    Colors.teal[100]!,
    Colors.pink[100]!,
  ];
  return colors[ascii % colors.length];
}

List<List<String>> channelsList = List.generate(
  10,
  (index) => [loremIpsum(words: 2)],
);

List<String> callsList = List.generate(
  20,
  (index) => loremIpsum(words: 1),
);

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
