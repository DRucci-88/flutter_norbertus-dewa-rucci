class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User(this.id, this.email, this.firstName, this.lastName, this.avatar);

  factory User.fromJson(Map<String, dynamic> user) {
    return User(
      user['id'],
      user['email'],
      user['first_name'],
      user['last_name'],
      user['avatar'],
    );
  }
}
