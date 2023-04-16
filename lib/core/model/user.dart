import 'dart:convert';

import 'package:hive/hive.dart';

class User {
  String uid;
  String email;
  String name;
  User({
    required this.uid,
    required this.email,
    required this.name,
  });

  User copyWith({
    String? uid,
    String? email,
    String? name,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(uid: $uid, email: $email, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.email == email &&
        other.name == name;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode ^ name.hashCode;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return User(
      uid: fields[0] as String,
      email: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name);
  }
}
