import 'dart:convert';

GetBusinessDetailPlaceIdModel getBusinessDetailPlaceIdModelFromJson(
        String str) =>
    GetBusinessDetailPlaceIdModel.fromJson(json.decode(str));

String getBusinessDetailPlaceIdModelToJson(
        GetBusinessDetailPlaceIdModel data) =>
    json.encode(data.toJson());

class GetBusinessDetailPlaceIdModel {
  bool? status;
  Data? data;
  String? message;

  GetBusinessDetailPlaceIdModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetBusinessDetailPlaceIdModel.fromJson(Map<String, dynamic> json) =>
      GetBusinessDetailPlaceIdModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Business? business;

  Data({
    this.business,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        business: json["business"] == null ? null : Business.fromJson(json["business"]),
      );

  Map<String, dynamic> toJson() => {
        "business": business?.toJson(),
      };
}

class Business {
  int? userId;
  int? categoryId;
  Category? category;
  double? latitude;
  double? longitude;
  String? address;
  String? phoneNumber;
  String? website;
  List<String>? openingHours;
  bool? openNow;
  List<String>? photos;
  dynamic rating;
  int? userRatingsTotal;
  List<Review>? reviews;
  List<dynamic>? coupons;
  List<LocalReview>? localReviews;
  String? placeId;
  String? title;

  Business({
    this.userId,
    this.categoryId,
    this.category,
    this.latitude,
    this.longitude,
    this.address,
    this.phoneNumber,
    this.website,
    this.openingHours,
    this.openNow,
    this.photos,
    this.rating,
    this.userRatingsTotal,
    this.reviews,
    this.coupons,
    this.localReviews,
    this.placeId,
    this.title,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        userId: json["user_id"],
        categoryId: json["category_id"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        phoneNumber: json["phone_number"],
        website: json["website"],
        openingHours: json["opening_hours"] == null
            ? null
            : List<String>.from(json["opening_hours"].map((x) => x)),
        openNow: json["open_now"],
        photos: json["photos"] == null
            ? null
            : List<String>.from(json["photos"].map((x) => x)),
        rating: json["rating"],
        userRatingsTotal: json["user_ratings_total"],
        reviews: json["reviews"] == null
            ? null
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        coupons: json["coupons"] == null
            ? null
            : List<dynamic>.from(json["coupons"].map((x) => x)),
        localReviews: json["local_reviews"] == null
            ? null
            : List<LocalReview>.from(
                json["local_reviews"].map((x) => LocalReview.fromJson(x))),
        placeId: json["place_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "category_id": categoryId,
        "category": category?.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "phone_number": phoneNumber,
        "website": website,
        "opening_hours": openingHours == null
            ? null
            : List<dynamic>.from(openingHours!.map((x) => x)),
        "open_now": openNow,
        "photos": photos == null
            ? null
            : List<dynamic>.from(photos!.map((x) => x)),
        "rating": rating,
        "user_ratings_total": userRatingsTotal,
        "reviews": reviews == null
            ? null
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "coupons": coupons == null
            ? null
            : List<dynamic>.from(coupons!.map((x) => x)),
        "local_reviews": localReviews == null
            ? null
            : List<dynamic>.from(localReviews!.map((x) => x.toJson())),
        "place_id": placeId,
        "title": title,
      };
}

class Category {
  int? id;
  String? name;
  String? guid;
  int? status;
  DateTime? createdAt;
  dynamic description;
  DateTime? updatedAt;
  List<Media>? media;

  Category({
    this.id,
    this.name,
    this.guid,
    this.status,
    this.createdAt,
    this.description,
    this.updatedAt,
    this.media,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        guid: json["guid"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        description: json["description"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        media: json["media"] == null
            ? null
            : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guid": guid,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "description": description,
        "updated_at": updatedAt?.toIso8601String(),
        "media": media == null
            ? null
            : List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}

class Media {
  int? id;
  String? originalUrl;

  Media({
    this.id,
    this.originalUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        originalUrl: json["original_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_url": originalUrl,
      };
}

class LocalReview {
  int? id;
  String? guid;
  dynamic rating;
  dynamic comment;
  LocalReviewUser? user;

  LocalReview({
    this.id,
    this.guid,
    this.rating,
    this.comment,
    this.user,
  });

  factory LocalReview.fromJson(Map<String, dynamic> json) => LocalReview(
        id: json["id"],
        guid: json["guid"],
        rating: json["rating"],
        comment: json["comment"],
        user: json["user"] == null ? null : LocalReviewUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guid": guid,
        "rating": rating,
        "comment": comment,
        "user": user?.toJson(),
      };
}

class LocalReviewUser {
  int? id;
  String? firstName;
  String? lastName;
  List<Media>? media;

  LocalReviewUser({
    this.id,
    this.firstName,
    this.lastName,
    this.media,
  });

  factory LocalReviewUser.fromJson(Map<String, dynamic> json) =>
      LocalReviewUser(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        media: json["media"] == null
            ? null
            : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "media": media == null
            ? null
            : List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}

class Review {
  String? authorName;
  String? profilePhotoUrl;
  dynamic rating;
  String? text;

  Review({
    this.authorName,
    this.profilePhotoUrl,
    this.rating,
    this.text,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        authorName: json["author_name"],
        profilePhotoUrl: json["profile_photo_url"],
        rating: json["rating"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "author_name": authorName,
        "profile_photo_url": profilePhotoUrl,
        "rating": rating,
        "text": text,
      };
}