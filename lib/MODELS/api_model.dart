// To parse this JSON data, do
//
//     final apiPracticeModel = apiPracticeModelFromJson(jsonString);

import 'dart:convert';

ApiPracticeModel apiPracticeModelFromJson(String str) => ApiPracticeModel.fromJson(json.decode(str));

String apiPracticeModelToJson(ApiPracticeModel data) => json.encode(data.toJson());

class ApiPracticeModel {
    ApiPracticeModel({
        this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
        this.support,
    });

    int? page;
    int? perPage;
    int? total;
    int? totalPages;
    List<Datum>? data;
    Support? support;

    factory ApiPracticeModel.fromJson(Map<String, dynamic> decodedData) => ApiPracticeModel(
        page: decodedData["page"],
        perPage: decodedData["per_page"],
        total: decodedData["total"],
        totalPages: decodedData["total_pages"],
        data: List<Datum>.from(decodedData["data"].map((x) => Datum.fromJson(x))),
        support: Support.fromJson(decodedData["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support!.toJson(),
    };
}

class Datum {
    Datum({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.avatar,
    });

    int? id;
    String? email;
    String? firstName;
    String? lastName;
    String? avatar;

    factory Datum.fromJson(Map<String, dynamic> decodedData) => Datum(
        id: decodedData["id"],
        email: decodedData["email"],
        firstName: decodedData["first_name"],
        lastName: decodedData["last_name"],
        avatar: decodedData["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    Support({
        this.url,
        this.text,
    });

    String? url;
    String? text;

    factory Support.fromJson(Map<String, dynamic> decodedData) => Support(
        url: decodedData["url"],
        text: decodedData["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
