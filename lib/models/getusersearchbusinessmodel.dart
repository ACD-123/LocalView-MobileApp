import 'dart:convert';

GetUserSearchBusnissModel? getUserSearchBusnissModelFromJson(String str) =>
    str.isNotEmpty
        ? GetUserSearchBusnissModel.fromJson(json.decode(str))
        : null;

String? getUserSearchBusnissModelToJson(GetUserSearchBusnissModel? data) =>
    data != null ? json.encode(data.toJson()) : null;

class GetUserSearchBusnissModel {
  bool? status;
  Data? data;
  String? message;

  GetUserSearchBusnissModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetUserSearchBusnissModel.fromJson(Map<String, dynamic> json) =>
      GetUserSearchBusnissModel(
        status: json["status"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  List<Business>? businesses;
  Pagination? pagination;

  Data({
    this.businesses,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        businesses: json["businesses"] != null
            ? List<Business>.from(
                json["businesses"].map((x) => Business.fromJson(x)))
            : null,
        pagination: json["pagination"] != null
            ? Pagination.fromJson(json["pagination"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "businesses": businesses != null
            ? List<dynamic>.from(businesses!.map((x) => x.toJson()))
            : null,
        "pagination": pagination?.toJson(),
      };
}

class Business {
  int? local;
  String? title;
  double? latitude;
  double? longitude;
  String? address;
  String? website;
  List<String>? photos;
  dynamic rating;
  String? placeId;
  dynamic distanceKm;
  String? businessGuid;
  Category? category;

  Business({
    this.local,
    this.title,
    this.latitude,
    this.longitude,
    this.address,
    this.website,
    this.photos,
    this.rating,
    this.placeId,
    this.distanceKm,
    this.businessGuid,
    this.category,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        local: json["local"],
        title: json["title"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        website: json["website"],
        photos: json["photos"] != null
            ? List<String>.from(json["photos"].map((x) => x))
            : null,
        rating: json["rating"]?.toDouble(),
        placeId: json["place_id"],
        distanceKm: json["distance_km"]?.toDouble(),
        businessGuid: json["business_guid"],
        category: json["category"] != null
            ? Category.fromJson(json["category"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "local": local,
        "title": title,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "website": website,
        "photos":
            photos != null ? List<dynamic>.from(photos!.map((x) => x)) : null,
        "rating": rating,
        "place_id": placeId,
        "distance_km": distanceKm,
        "business_guid": businessGuid,
        "category": category?.toJson(),
      };
}

class Category {
  int? id;
  String? name;
  String? guid;

  Category({this.id, this.name, this.guid});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        guid: json["guid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guid": guid,
      };
}

class Pagination {
  String? nextPageToken;

  Pagination({
    this.nextPageToken,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        nextPageToken: json["next_page_token"],
      );

  Map<String, dynamic> toJson() => {
        "next_page_token": nextPageToken,
      };
}
