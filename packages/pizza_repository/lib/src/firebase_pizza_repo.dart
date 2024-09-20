import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/pizza_repository.dart';

class FirebasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection
          .get()
          .then((value) => value.docs
          .map((pizza) => Pizza.fromEntity(PizzaEntity.fromJson(pizza.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
