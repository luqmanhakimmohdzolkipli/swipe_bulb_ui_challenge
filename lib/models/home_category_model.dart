import 'dart:convert';

List<HomeCategoryModel> listHomeCategoryModelFromJson(String str) =>
    List<HomeCategoryModel>.from(
        json.decode(str).map((x) => HomeCategoryModel.fromJson(x)));

class HomeCategoryModel {
  const HomeCategoryModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }
}
