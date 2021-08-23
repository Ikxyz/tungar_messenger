import 'dart:convert';

class UserModel {
  final String uid;
  final String name;
  final String photo;
  final String email;

  UserModel({
    required this.uid,
    required this.name,
    required this.photo,
    required this.email,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? photo,
    String? email,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'photo': photo,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      photo: map['photo'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'user(uid: $uid, name: $name, photo: $photo, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.name == name &&
        other.photo == photo &&
        other.email == email;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ photo.hashCode ^ email.hashCode;
  }
}
