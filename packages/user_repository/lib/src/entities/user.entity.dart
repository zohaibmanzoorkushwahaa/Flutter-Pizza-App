
class MyUserEntity {
  String userId;
  String email;
  String password;
  String name;
  bool hasActiveCart;

  // Constructor
  MyUserEntity({
    required this.userId,
    required this.email,
    required this.password,
    required this.name,
    this.hasActiveCart = false, // Default value if not provided
  });

  // Convert MyUser instance to a map (for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'password': password,
      'name': name,
      'hasActiveCart': hasActiveCart,
    };
  }

  // Create a MyUser instance from a map (for JSON deserialization)
  static MyUserEntity fromJson(Map<String, dynamic> json) {
    return MyUserEntity(
      userId: json['userId'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      hasActiveCart: json['hasActiveCart'] ?? false, // Default to false if null
    );
  }

}