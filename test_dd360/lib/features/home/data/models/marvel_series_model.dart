class MarvelSeriesModel {
  int? id;
  String? title;
  String? description;
  String? resourceUri;
  List<Url>? urls;
  int? startYear;
  int? endYear;
  String? rating;
  String? type;
  String? modified;
  Thumbnail? thumbnail;
  Creators? creators;

  MarvelSeriesModel({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.startYear,
    this.endYear,
    this.rating,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
  });

  factory MarvelSeriesModel.fromJson(Map<String, dynamic> json) =>
      MarvelSeriesModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        startYear: json["startYear"],
        endYear: json["endYear"],
        rating: json["rating"],
        type: json["type"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        creators: Creators.fromJson(json["creators"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls!.map((x) => x.toJson())),
        "startYear": startYear,
        "endYear": endYear,
        "rating": rating,
        "type": type,
        "modified": modified,
        "thumbnail": thumbnail?.toJson(),
        "creators": creators?.toJson(),
      };
}

class Creators {
  int? available;
  String? collectionUri;
  List<Item>? items;

  Creators({
    this.available,
    this.collectionUri,
    this.items,
  });

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  String? resourceUri;
  String? name;
  String? role;

  Item({
    this.resourceUri,
    this.name,
    this.role,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
      };
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };
}

class Url {
  String? type;
  String? url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}
