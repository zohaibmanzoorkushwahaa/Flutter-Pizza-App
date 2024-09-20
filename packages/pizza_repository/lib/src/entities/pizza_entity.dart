import 'package:pizza_repository/src/entities/entites.dart';
import '../models/macros.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String descriptions;
  int price;
  int discount;
  Macros macros;

  PizzaEntity({
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
  // Convert a PizzaEntity instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'pizzaId': pizzaId,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'descriptions': descriptions,
      'price': price,
      'discount': discount,
      'macros': macros.toEntity().toJson(), // Assuming Macros has a toJson method
    };
  }

  // Create a PizzaEntity instance from a JSON map
  static PizzaEntity fromJson(Map<String, dynamic> json) {
    return PizzaEntity(
      pizzaId : json['pizzaId'],
      picture : json['picture'],
      isVeg : json['isVeg'],
      spicy : json['spicy'],
      name : json['name'],
      descriptions : json['descriptions'],
      price : json['price'],
      discount : json['discount'],
      macros : Macros.fromEntity(MacrosEntity.fromJson(json['macros'])), // Assuming Macros has a fromJson method
    );
  }

}