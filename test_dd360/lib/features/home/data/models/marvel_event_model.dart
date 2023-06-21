class MarvelEventsModel {
  int? id;
  String? title;
  String? description;
  String? resourceUri;
  List<Url>? urls;
  String? modified;
  DateTime? start;
  DateTime? end;
  Thumbnail? thumbnail;
  Creators? creators;

  MarvelEventsModel({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.modified,
    this.start,
    this.end,
    this.thumbnail,
    this.creators,
  });

  factory MarvelEventsModel.fromJson(Map<String, dynamic> json) =>
      MarvelEventsModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        modified: json["modified"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        creators: Creators.fromJson(json["creators"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls!.map((x) => x.toJson())),
        "modified": modified,
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "thumbnail": thumbnail?.toJson(),
        "creators": creators?.toJson(),
      };
}

class Creators {
  int available;
  String collectionUri;
  List<Item> items;

  Creators({
    required this.available,
    required this.collectionUri,
    required this.items,
  });

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
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
