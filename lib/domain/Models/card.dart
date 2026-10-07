import 'package:flutter/material.dart';

class CardData {
  final String text;
  final String descriptionText;
  final String information;
  final IconData icon;
  final String? imageUrl;

  CardData(
    this.text, {
    required this.descriptionText,
    required this.information,
    this.icon = Icons.ac_unit_outlined,
    this.imageUrl,
  });
}
