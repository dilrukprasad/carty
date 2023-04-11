// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

class ProductModel {
  ProductModel({
    this.result,
    this.data,
  });

  final String? result;
  final List<Datum>? data;

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        result: json["result"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.sku,
    this.name,
    this.brandName,
    this.mainImage,
    this.price,
    this.sizes,
    this.stockStatus,
    this.colour,
    this.description,
    this.inCart = false,
  });

  final String? id;
  final String? sku;
  final String? name;
  final String? brandName;
  final String? mainImage;
  final Price? price;
  final List<String>? sizes;
  final String? stockStatus;
  final String? colour;
  final String? description;
  bool inCart;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["SKU"],
        name: json["name"],
        brandName: json["brandName"],
        mainImage: json["mainImage"],
        price: Price.fromJson(json["price"]),
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        stockStatus: json["stockStatus"],
        colour: json["colour"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "SKU": sku,
        "name": name,
        "brandName": brandName,
        "mainImage": mainImage,
        "price": price!.toJson(),
        "sizes": List<dynamic>.from(sizes!.map((x) => x)),
        "stockStatus": stockStatus,
        "colour": colour,
        "description": description,
      };
}

class Price {
  Price({
    this.amount,
    this.currency,
  });

  final String? amount;
  final String? currency;

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency,
      };
}
