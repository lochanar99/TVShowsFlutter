
final String users = 'users';

class UserFields{
  static final String id = '_id';
  static final String email = 'email';
  static final String password = 'password';
}

class Users {

  final int? id;
  final String email;
  final String password;

  const Users({
    this.id,
    required this.email,
    required this.password,
});

  Users copy({
  int? id,
    String? email,
    String? password,

}) =>
  Users(
    id: id?? this.id,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.email: email,
    UserFields.password: password,
  };
}