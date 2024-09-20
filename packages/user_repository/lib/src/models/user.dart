import'package:flutter/material.dart';
import '../entities/entities.dart';


class MyUser {
  String userId;
  String email;
  String password;
  String name;
  bool hasActiveCart;

  // Constructor
  MyUser({
    required this.userId,
    required this.email,
    required this.password,
    required this.name,
    this.hasActiveCart = false, // Default value if not provided
  });

  static final empty = MyUser(
      userId: '',
      email: '',
      password: '',
      name: ''
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      hasActiveCart: hasActiveCart,
      password: password,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userId: entity.userId,
        email: entity.email,
        password: entity.password,
        name: entity.name,
        hasActiveCart: entity.hasActiveCart
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'MyUser: $userId, $email, $password, $name, $hasActiveCart';
  }
}
