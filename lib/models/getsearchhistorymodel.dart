import 'dart:convert';

GetSearchHistoryModel getSearchHistoryModelFromJson(String str) => GetSearchHistoryModel.fromJson(json.decode(str));

String getSearchHistoryModelToJson(GetSearchHistoryModel data) => json.encode(data.toJson());

class GetSearchHistoryModel {
    bool? status;
    Data? data;
    String? message;

    GetSearchHistoryModel({
        this.status,
        this.data,
        this.message,
    });

    factory GetSearchHistoryModel.fromJson(Map<String, dynamic> json) => GetSearchHistoryModel(
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
    List<CategoryWiseSearch>? categoryWiseSearch;

    Data({
        this.categoryWiseSearch,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoryWiseSearch: json["category_wise_search"] != null
            ? List<CategoryWiseSearch>.from(json["category_wise_search"].map((x) => CategoryWiseSearch.fromJson(x)))
            : [],
    );

    Map<String, dynamic> toJson() => {
        "category_wise_search": categoryWiseSearch != null
            ? List<dynamic>.from(categoryWiseSearch!.map((x) => x.toJson()))
            : [],
    };
}

class CategoryWiseSearch {
    int? id;
    String? name;
    String? guid;
    List<SearchHistory>? searchHistory;

    CategoryWiseSearch({
        this.id,
        this.name,
        this.guid,
        this.searchHistory,
    });

    factory CategoryWiseSearch.fromJson(Map<String, dynamic> json) => CategoryWiseSearch(
        id: json["id"],
        name: json["name"],
        guid: json["guid"],
        searchHistory: json["search_history"] != null
            ? List<SearchHistory>.from(json["search_history"].map((x) => SearchHistory.fromJson(x)))
            : [],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guid": guid,
        "search_history": searchHistory != null
            ? List<dynamic>.from(searchHistory!.map((x) => x.toJson()))
            : [],
    };
}

class SearchHistory {
    int? id;
    int? userId;
    int? businessId;
    int? categoryId;
    String? placeId;
    String? name;
    String? address;
    String? guid;
    String? businessGuid;

    SearchHistory({
        this.id,
        this.userId,
        this.businessId,
        this.categoryId,
        this.placeId,
        this.name,
        this.address,
        this.guid,
        this.businessGuid,
    });

    factory SearchHistory.fromJson(Map<String, dynamic> json) => SearchHistory(
        id: json["id"],
        userId: json["user_id"],
        businessId: json["business_id"],
        categoryId: json["category_id"],
        placeId: json["place_id"],
        name: json["name"],
        address: json["address"],
        guid: json["guid"],
        businessGuid: json["business_guid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "business_id": businessId,
        "category_id": categoryId,
        "place_id": placeId,
        "name": name,
        "address": address,
        "guid": guid,
        "business_guid": businessGuid,
    };
}
