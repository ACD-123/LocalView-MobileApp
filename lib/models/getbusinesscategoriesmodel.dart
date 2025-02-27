import 'dart:convert';

GetBusinessCategoriesModel? getCategoriesListModelFromJson(String str) =>
    str.isNotEmpty ? GetBusinessCategoriesModel.fromJson(json.decode(str)) : null;

String getCategoriesListModelToJson(GetBusinessCategoriesModel? data) =>
    json.encode(data?.toJson());

class GetBusinessCategoriesModel {
  bool? status;
  Data? data;
  String? message;

  GetBusinessCategoriesModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetBusinessCategoriesModel.fromJson(Map<String, dynamic> json) =>
      GetBusinessCategoriesModel(
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
  List<Category>? categories;
  Pagination? pagination;

  Data({
    this.categories,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: json["categories"] != null
            ? List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x)))
            : [],
        pagination: json["pagination"] != null
            ? Pagination.fromJson(json["pagination"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "categories": categories?.map((x) => x.toJson()).toList(),
        "pagination": pagination?.toJson(),
      };
}

class Category {
  int? id;
  String? name;
  String? guid;
  String? description;
  String? image;

  Category({
    this.id,
    this.name,
    this.guid,
    this.description,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        guid: json["guid"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guid": guid,
        "description": description,
        "image": image,
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
