class ProjectDetails {
  String? id;
  String? title;
  String? category;
  String? description;
  String? coverImageUrl;
  String? bannerImageUrl;
  List<String>? stills;
  String? production;
  String? directors;
  String? producers;
  String? cinematographers;
  String? actors;
  String? awards;
  double? aspectRatio;

  ProjectDetails({
    this.id,
    this.title,
    this.category,
    this.description,
    this.coverImageUrl,
    this.bannerImageUrl,
    this.stills,
    this.production,
    this.directors,
    this.producers,
    this.cinematographers,
    this.actors,
    this.awards,
    this.aspectRatio,
  });
}