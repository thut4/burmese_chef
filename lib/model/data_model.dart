// import 'dart:convert';

// List<BurmeseMeal> burmeseMealFromJson(String str) => List<BurmeseMeal>.from(
//     json.decode(str).map((x) => BurmeseMeal.fromJson(x)));

// String burmeseMealToJson(List<BurmeseMeal> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class BurmeseMeal {
//   final String guid;
//   final String name;
//   final String ingredients;
//   final String cookingInstructions;
//   final String userType;
//   final String image;

//   BurmeseMeal({
//     required this.guid,
//     required this.name,
//     required this.ingredients,
//     required this.cookingInstructions,
//     required this.userType,
//     required this.image,
//   });

//   factory BurmeseMeal.fromJson(Map<String, dynamic> json) => BurmeseMeal(
//       guid: json["Guid"],
//       name: json["Name"],
//       ingredients: json["Ingredients"],
//       cookingInstructions: json["CookingInstructions"],
//       userType: json["UserType"],
//       image: json["Image"] ?? 'not');

//   Map<String, dynamic> toJson() => {
//         "Guid": guid,
//         "Name": name,
//         "Ingredients": ingredients,
//         "CookingInstructions": cookingInstructions,
//         "UserType": userType,
//         "Image": image,
//       };
// }

// To parse this JSON data, do
//
//     final burmeseMeal = burmeseMealFromJson(jsonString);

import 'dart:convert';

List<BurmeseMeal> burmeseMealFromJson(String str) => List<BurmeseMeal>.from(
    json.decode(str).map((x) => BurmeseMeal.fromJson(x)));

String burmeseMealToJson(List<BurmeseMeal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BurmeseMeal {
  final String guid;
  final String name;
  final String ingredients;
  final String cookingInstructions;
  final String userType;
  final String image;

  BurmeseMeal({
    required this.guid,
    required this.name,
    required this.ingredients,
    required this.cookingInstructions,
    required this.userType,
    required this.image,
  });

  factory BurmeseMeal.fromJson(Map<String, dynamic> json) => BurmeseMeal(
        guid: json["Guid"],
        name: json["Name"],
        ingredients: json["Ingredients"],
        cookingInstructions: json["CookingInstructions"],
        userType: json["UserType"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "Guid": guid,
        "Name": name,
        "Ingredients": ingredients,
        "CookingInstructions": cookingInstructions,
        "UserType": userType,
        "Image": image,
      };
}
