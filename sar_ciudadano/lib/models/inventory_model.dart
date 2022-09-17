// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

List<UserData> userDataFromJson(String str) =>
    List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

String userDataToJson(List<UserData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData {
  UserData({
    this.first = "",
    this.last = "",
    this.email = "",
    this.address = "",
    this.created = "",
    this.balance = "",
  });

  String first;
  String last;
  String email;
  String address;
  String created;
  String balance;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        first: json["first"],
        last: json["last"],
        email: json["email"],
        address: json["address"],
        created: json["created"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "email": email,
        "address": address,
        "created": created,
        "balance": balance,
      };
}
