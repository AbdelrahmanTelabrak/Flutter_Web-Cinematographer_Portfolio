import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_details.dart';

class ProjectDetailsModel extends ProjectDetails {
  ProjectDetailsModel({
    super.id,
    super.title,
    super.category,
    super.description,
    super.coverImageUrl,
    super.bannerImageUrl,
    super.stills,
    super.production,
    super.directors,
    super.producers,
    super.cinematographers,
    super.actors,
    super.awards,
    super.aspectRatio,
  });

  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json){
    return ProjectDetailsModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      coverImageUrl: json['coverImageUrl'],
      bannerImageUrl: json['bannerImageUrl'],
      stills: (json['stills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      production: json['production'],
      directors: json['directors'],
      producers: json['producers'],
      cinematographers: json['cinematographers'],
      actors: json['actors'],
      awards: json['awards'],
      aspectRatio: double.parse(json['aspectRatio'].split(':')[0]) / double.parse(json['aspectRatio'].split(':')[1]),
    );
  }

  // factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) {
  //   return ProjectDetailsModel(
  //     id: json['id'] as String?,
  //     title: json['title'] as String?,
  //     category: json['category'] as String?,
  //     description: json['description'] as String?,
  //     coverImageUrl: json['coverImageUrl'] as String?,
  //     bannerImageUrl: json['bannerImageUrl'] as String?,
  //     stills: (json['stills'] as List<dynamic>?)?.map((e) => e as String).toList(),
  //     production: json['production'] as String?,
  //     directors: (json['directors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  //     producers: (json['producers'] as List<dynamic>?)?.map((e) => e as String).toList(),
  //     cinematographers: (json['cinematographers'] as List<dynamic>?)?.map((e) => e as String).toList(),
  //     actors: (json['actors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  //     awards: (json['awards'] as List<dynamic>?)?.map((e) => e as String).toList(),
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'coverImageUrl': coverImageUrl,
      'bannerImageUrl': bannerImageUrl,
      'stills': stills,
      'production': production,
      'directors': directors,
      'producers': producers,
      'cinematographers': cinematographers,
      'actors': actors,
      'awards': awards,
      'aspectRatio': aspectRatio,
    };
  }
}