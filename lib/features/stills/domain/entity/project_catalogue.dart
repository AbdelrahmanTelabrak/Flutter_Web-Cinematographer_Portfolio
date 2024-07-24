class ProjectCatalogue {

  String? id;
  String? title;
  String? category;
  String? coverImageUrl;
  double? aspectRatio;

  ProjectCatalogue({
    this.id,
    this.title,
    this.category,
    this.coverImageUrl,
    this.aspectRatio,
  });

  @override
  String toString() {
    return 'ProjectCatalogue{id: $id, title: $title, category: $category, coverImageUrl: $coverImageUrl, aspectRatio: $aspectRatio}';
  }
}