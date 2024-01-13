import 'dart:convert';

List<UsersType> usersTypeFromJson(String str) =>
    List<UsersType>.from(json.decode(str).map((x) => UsersType.fromJson(x)));

String usersTypeToJson(List<UsersType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersType {
  final int userId;
  final String userCode;
  final String userMmType;
  final String userEngType;

  UsersType({
    required this.userId,
    required this.userCode,
    required this.userMmType,
    required this.userEngType,
  });

  factory UsersType.fromJson(Map<String, dynamic> json) => UsersType(
        userId: json["UserId"],
        userCode: json["UserCode"],
        userMmType: json["UserMMType"],
        userEngType: json["UserEngType"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "UserCode": userCode,
        "UserMMType": userMmType,
        "UserEngType": userEngType,
      };
}
