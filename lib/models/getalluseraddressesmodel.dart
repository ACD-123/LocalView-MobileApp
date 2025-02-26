import 'dart:convert';

GetAllUserAddressesModel getUserAddressesListModelFromJson(String str) =>
    GetAllUserAddressesModel.fromJson(json.decode(str));

String getUserAddressesListModelToJson(GetAllUserAddressesModel data) =>
    json.encode(data.toJson());

class GetAllUserAddressesModel {
  bool? status;
  Data? data;
  String? message;

  GetAllUserAddressesModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetAllUserAddressesModel.fromJson(Map<String, dynamic> json) =>
      GetAllUserAddressesModel(
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
  Default? dataDefault;
  Pagination? pagination;
  List<Default>? userAddress;

  Data({
    this.dataDefault,
    this.pagination,
    this.userAddress,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataDefault:
            json["default"] != null ? Default.fromJson(json["default"]) : null,
        pagination: json["pagination"] != null
            ? Pagination.fromJson(json["pagination"])
            : null,
        userAddress: json["user_address"] != null
            ? List<Default>.from(
                json["user_address"].map((x) => Default.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "default": dataDefault?.toJson(),
        "pagination": pagination?.toJson(),
        "user_address": userAddress != null
            ? List<dynamic>.from(userAddress!.map((x) => x.toJson()))
            : null,
      };
}

class Default {
  int? id;
  int? userId;
  String? label;
  String? city;
  String? country;
  String? latitude;
  String? longitude;
  String? state;
  String? zip;
  String? address;
  String? guid;

  Default({
    this.id,
    this.userId,
    this.label,
    this.city,
    this.country,
    this.latitude,
    this.longitude,
    this.state,
    this.zip,
    this.address,
    this.guid,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        id: json["id"],
        userId: json["user_id"],
        label: json["label"],
        city: json["city"],
        country: json["country"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        state: json["state"],
        zip: json["zip"],
        address: json["address"],
        guid: json["guid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "label": label,
        "city": city,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "state": state,
        "zip": zip,
        "address": address,
        "guid": guid,
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
