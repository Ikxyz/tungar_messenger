import 'dart:convert';

class UserModel {
  final String uid;
  final String name;
  final String photo;
  final String email;
  final String username;
  UserModel({
    required this.uid,
    required this.name,
    required this.photo,
    required this.email,
    required this.username,
  });

 

  UserModel copyWith({
    String? uid,
    String? name,
    String? photo,
    String? email,
    String? username,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'photo': photo,
      'email': email,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      photo: map['photo'],
      email: map['email'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, photo: $photo, email: $email, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.uid == uid &&
        other.name == name &&
        other.photo == photo &&
      other.email == email &&
        other.username == username;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        photo.hashCode ^
        email.hashCode ^
        username.hashCode;
  }
}
