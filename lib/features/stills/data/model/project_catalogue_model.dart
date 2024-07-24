import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_catalogue.dart';

class ProjectCatalogueModel extends ProjectCatalogue{
  ProjectCatalogueModel({
    super.id,
    super.title,
    super.category,
    super.coverImageUrl,
    super.aspectRatio,
  });

  factory ProjectCatalogueModel.fromJson(Map<String, dynamic> json){
    // print('IN MODEL FROMJSON: $json');
    // print(json);
    return ProjectCatalogueModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      coverImageUrl: json['coverImageUrl'],
      aspectRatio: double.parse(json['aspectRatio'].split(':')[0]) / double.parse(json['aspectRatio'].split(':')[1]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'coverImageUrl': coverImageUrl,
      'aspectRatio': aspectRatio,
    };
  }
}