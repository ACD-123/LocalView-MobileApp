import 'dart:convert';

GetProfileDatModel? getProfileDatModelFromJson(String str) =>
    str.isNotEmpty ? GetProfileDatModel.fromJson(json.decode(str)) : null;

String getProfileDatModelToJson(GetProfileDatModel? data) =>
    json.encode(data?.toJson());

class GetProfileDatModel {
  bool? status;
  Data? data;
  String? message;

  GetProfileDatModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetProfileDatModel.fromJson(Map<String, dynamic> json) =>
      GetProfileDatModel(
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
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  List<Media>? media;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.media,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        media: json["media"] != null
            ? List<Media>.from(json["media"].map((x) => Media.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "media": media != null
            ? List<dynamic>.from(media!.map((x) => x.toJson()))
            : null,
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
