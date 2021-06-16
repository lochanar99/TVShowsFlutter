final String usersTable = 'users';

class UserFields {
  static final String id = '_id';
  static final String email = 'email';
  static final String name = 'name';
  static final String password = 'password';
}

class Users {
  final int? id;
  final String email;
  final String name;
  final String password;

  const Users({
    this.id,
    required this.email,
    required this.name,
    required this.password,
  });

  Users copy({
    int? id,
    String? email,
    String? name,
    String? password,
  }) =>
      Users(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password,
      );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.email: email,
        UserFields.name: name,
        UserFields.password: password,
      };
}
