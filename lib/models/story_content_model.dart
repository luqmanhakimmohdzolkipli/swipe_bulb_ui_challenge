import 'dart:convert';

List<StoryContentModel> listStoryContentModelFromJson(String str) =>
    List<StoryContentModel>.from(
        json.decode(str).map((x) => StoryContentModel.fromJson(x)));

class StoryContentModel {
  const StoryContentModel({
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  factory StoryContentModel.fromJson(Map<String, dynamic> json) {
    return StoryContentModel(
      name: json['name'],
      image: json['image'],
    );
  }
}
