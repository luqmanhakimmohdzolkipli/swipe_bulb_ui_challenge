import 'dart:convert';

List<StoryHeaderModel> listStoryHeaderModelFromJson(String str) =>
    List<StoryHeaderModel>.from(
        json.decode(str).map((x) => StoryHeaderModel.fromJson(x)));

class StoryHeaderModel {
  const StoryHeaderModel({
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  factory StoryHeaderModel.fromJson(Map<String, dynamic> json) {
    return StoryHeaderModel(
      name: json['name'],
      image: json['image'],
    );
  }
}