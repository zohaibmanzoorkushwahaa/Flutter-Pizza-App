import 'package:flutter/material.dart';

class MacrosEntity {
  int calories;
  int proteins;
  int fat;
  int carbs;


  MacrosEntity({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  // Convert a MacrosEntity instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'proteins': proteins,
      'fat': fat,
      'carbs': carbs,
    };
  }

  // Create a MacrosEntity instance from a JSON map
  static MacrosEntity fromJson(Map<String, dynamic> json) {
    return MacrosEntity(
      calories: json['calories'],
      proteins: json['proteins'],
      fat: json['fat'],
      carbs: json['carbs'],
    );
  }
}