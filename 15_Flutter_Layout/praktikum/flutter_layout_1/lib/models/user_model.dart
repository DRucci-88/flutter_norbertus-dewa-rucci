class User {
  int id;
  String name;
  String imageUrl;
  String recentChat;

  User(
    this.id,
    this.name,
    this.recentChat,
    this.imageUrl,
  );
}

final List<User> users = [
  User(0, 'Norbertus', 'Senang bertemu denganmu !', 'assets/images/love.jpg'),
  User(1, 'Dewa', 'Kelaparan gak ?', 'assets/images/profile.png'),
  User(2, 'Rucci', 'Blob / Provider', 'assets/images/love.jpg'),
  User(0, 'Norbertus', 'Senang bertemu denganmu !', 'assets/images/love.jpg'),
  User(1, 'Dewa', 'Kelaparan gak ?', 'assets/images/profile.png'),
  User(2, 'Rucci', 'Blob / Provider', 'assets/images/love.jpg'),
  User(
      0, 'Norbertus', 'Senang bertemu denganmu !', 'assets/images/profile.png'),
  User(1, 'Dewa', 'Kelaparan gak ?', 'assets/images/love.jpg'),
  User(2, 'Rucci', 'Blob / Provider', 'assets/images/profile.png'),
];
