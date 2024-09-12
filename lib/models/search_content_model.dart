import 'dart:convert';

List<SearchContentModel> listSearchContentModelFromJson(String str) =>
    List<SearchContentModel>.from(
        json.decode(str).map((x) => SearchContentModel.fromJson(x)));

class SearchContentModel {
  const SearchContentModel({
    required this.title,
    required this.name,
    required this.image,
    required this.location,
  });

  final String title;
  final String name;
  final String image;
  final String location;

  factory SearchContentModel.fromJson(Map<String, dynamic> json) {
    return SearchContentModel(
      title: json['title'],
      name: json['name'],
      image: json['image'],
      location: json['location'],
    );
  }
}
