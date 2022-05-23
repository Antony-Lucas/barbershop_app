import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.name,
    required this.username,
    required this.roles,
    required this.createdAt,
    required this.v,
  });

  String id;
  String name;
  String username;
  List<String> roles;
  DateTime createdAt;
  int v;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["_id"],
        name: json["name"],
        username: json["username"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "username": username,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}

class Album {
  final int id;
  final String title;

  Album({
    required this.id, 
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
