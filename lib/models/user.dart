class User {
  String name;
  String phoneNumber;

  User({required this.name, required this.phoneNumber});

  bool operator ==(Object object) {
    return (object is User) &&
        (object.name == name) &&
        (object.phoneNumber == phoneNumber);
  }
}
