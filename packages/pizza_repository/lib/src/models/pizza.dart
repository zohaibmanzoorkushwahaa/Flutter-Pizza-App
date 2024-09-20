
import 'package:flutter/material.dart';
import '../entities/entites.dart';
import 'macros.dart';

class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String descriptions;
  int price;
  int discount;
  Macros macros;

  Pizza({
   required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.descriptions,
    required this.price,
    required this.discount,
    required this.macros
  });

  PizzaEntity toEntity() {
    return PizzaEntity(
      pizzaId: pizzaId,
      picture: picture,
      isVeg: isVeg,
      spicy: spicy,
      name: name,
      descriptions: descriptions,
      price: price,
      discount: discount,
      macros: macros
    );
  }

  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
        pizzaId:  entity.pizzaId,
        picture: entity.picture,
        isVeg: entity.isVeg,
        spicy: entity.spicy,
        name: entity.name,
        descriptions: entity.descriptions,
        price: entity.price,
        discount: entity.discount,
        macros: entity.macros
    );
  }
}