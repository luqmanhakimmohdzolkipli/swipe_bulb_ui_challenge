import 'dart:convert';

List<HomeHeaderModel> listHomeHeaderModelFromJson(String str) =>
    List<HomeHeaderModel>.from(
        json.decode(str).map((x) => HomeHeaderModel.fromJson(x)));

class HomeHeaderModel {
  const HomeHeaderModel({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;

  factory HomeHeaderModel.fromJson(Map<String, dynamic> json) {
    return HomeHeaderModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      image: json['image'] as String,
    );
  }
}
