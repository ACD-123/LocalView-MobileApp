import 'dart:convert';

GetBlogByIdModel? getBlogByIdModelFromJson(String str) =>
    str.isNotEmpty ? GetBlogByIdModel.fromJson(json.decode(str)) : null;

String getBlogByIdModelToJson(GetBlogByIdModel? data) =>
    json.encode(data?.toJson());

class GetBlogByIdModel {
  bool? status;
  Data? data;
  String? message;

  GetBlogByIdModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetBlogByIdModel.fromJson(Map<String, dynamic> json) =>
      GetBlogByIdModel(
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
  Blog? blog;

  Data({this.blog});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        blog: json["blog"] != null ? Blog.fromJson(json["blog"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "blog": blog?.toJson(),
      };
}

class Blog {
  int? id;
  int? blogCategoryId;
  int? userId;
  String? title;
  String? description;
  String? publishDate;
  String? views;
  String? guid;
  String? image;
  User? user;
  Category? category;

  Blog({
    this.id,
    this.blogCategoryId,
    this.userId,
    this.title,
    this.description,
    this.publishDate,
    this.views,
    this.guid,
    this.image,
    this.user,
    this.category,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        blogCategoryId: json["blog_category_id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        publishDate: json["publish_date"],
        views: json["views"],
        guid: json["guid"],
        image: json["image"],
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
        category: json["category"] != null
            ? Category.fromJson(json["category"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "blog_category_id": blogCategoryId,
        "user_id": userId,
        "title": title,
        "description": description,
        "publish_date": publishDate,
        "views": views,
        "guid": guid,
        "image": image,
        "user": user?.toJson(),
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

class Media {
  int? id;
  String? originalUrl;

  Media({this.id, this.originalUrl});

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        originalUrl: json["original_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_url": originalUrl,
      };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  List<Media>? media;

  User({this.id, this.firstName, this.lastName, this.media});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        media: json["media"] != null
            ? List<Media>.from(json["media"].map((x) => Media.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "media": media != null
            ? List<dynamic>.from(media!.map((x) => x.toJson()))
            : null,
      };
}
