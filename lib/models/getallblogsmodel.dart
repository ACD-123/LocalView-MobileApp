import 'dart:convert';

GetAllBlogsModel? getAllBlogsModelFromJson(String str) =>
    str.isNotEmpty ? GetAllBlogsModel.fromJson(json.decode(str)) : null;

String getAllBlogsModelToJson(GetAllBlogsModel? data) =>
    json.encode(data?.toJson() ?? {});

class GetAllBlogsModel {
  bool? status;
  Data? data;
  String? message;

  GetAllBlogsModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetAllBlogsModel.fromJson(Map<String, dynamic> json) => GetAllBlogsModel(
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
  List<Blog>? blogs;
  Pagination? pagination;

  Data({
    this.blogs,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        blogs: json["blogs"] != null
            ? List<Blog>.from(json["blogs"].map((x) => Blog.fromJson(x)))
            : null,
        pagination:
            json["pagination"] != null ? Pagination.fromJson(json["pagination"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "blogs": blogs?.map((x) => x.toJson()).toList(),
        "pagination": pagination?.toJson(),
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
  List<Media>? media;
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
    this.media,
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
        media: json["media"] != null
            ? List<Media>.from(json["media"].map((x) => Media.fromJson(x)))
            : null,
        category: json["category"] != null ? Category.fromJson(json["category"]) : null,
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
        "media": media?.map((x) => x.toJson()).toList(),
        "category": category?.toJson(),
      };
}

class Category {
  int? id;
  String? name;
  String? guid;

  Category({
    this.id,
    this.name,
    this.guid,
  });

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

class Pagination {
  dynamic total;
  dynamic page;
  dynamic totalPages;

  Pagination({
    this.total,
    this.page,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        page: json["page"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "total_pages": totalPages,
      };
}
