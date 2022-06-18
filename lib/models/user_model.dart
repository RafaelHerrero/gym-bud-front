class User {
  String userId;
  String userFirstName;
  String userLastName;
  String userLogin;
  String userPassword;

  User({
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userLogin,
    required this.userPassword,
  });

  User.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        userFirstName = json['user_firstname'],
        userLastName = json['user_lastname'],
        userLogin = json['user_login'],
        userPassword = json['user_password'];

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'user_firstname': userFirstName,
        'user_lastname': userLastName,
        'user_login': userLogin,
        'user_password': userPassword,
      };
}
