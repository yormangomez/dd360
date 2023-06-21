class MarvelStoriesModel {
  int? id;
  String? title;
  String? description;
  String? resourceUri;
  String? type;
  String? modified;

  MarvelStoriesModel({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.type,
    this.modified,
  });

  factory MarvelStoriesModel.fromJson(Map<String, dynamic> json) =>
      MarvelStoriesModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        type: json["type"],
        modified: json["modified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "type": type,
        "modified": modified,
      };
}
