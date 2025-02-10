import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle userTextStyle = TextStyle(color: Colors.white);
  static const TextStyle nivelTextStyle = TextStyle(
    color: Colors.green,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        blurRadius: 5.0,
        color: Colors.black54,
        offset: Offset(2, 2),
      ),
    ],
  );
  static const TextStyle nivelCardTitleTextStyle = TextStyle(
    color: Colors.green,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle nivelCardSubtitleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );
  static const TextStyle headerTitleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headerSubtitleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
}
