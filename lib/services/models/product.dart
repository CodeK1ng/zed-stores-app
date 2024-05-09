// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

ProductResponse productResponseFromJson(String str) =>
    ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) =>
    json.encode(data.toJson());

class ProductResponse {
  String? name;
  String? description;
  String? price;
  int? discount;
  int? stock;
  List<String>? imageUrls;
  String? salePrice;
  bool? sale;
  Supplier? supplier;
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductResponse({
    this.name,
    this.description,
    this.price,
    this.discount,
    this.stock,
    this.imageUrls,
    this.salePrice,
    this.sale,
    this.supplier,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        discount: json["discount"],
        stock: json["stock"],
        imageUrls: json["imageUrls"] == null
            ? []
            : List<String>.from(json["imageUrls"]!.map((x) => x)),
        salePrice: json["salePrice"],
        sale: json["sale"],
        supplier: json["supplier"] == null
            ? null
            : Supplier.fromJson(json["supplier"]),
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "discount": discount,
        "stock": stock,
        "imageUrls": imageUrls == null
            ? []
            : List<dynamic>.from(imageUrls!.map((x) => x)),
        "salePrice": salePrice,
        "sale": sale,
        "supplier": supplier?.toJson(),
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Supplier {
  String? imageUrl;
  String? name;
  String? email;
  List<String>? phoneNumbers;
  String? address;
  String? city;
  String? province;
  String? country;
  List<dynamic>? products;
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  Supplier({
    this.imageUrl,
    this.name,
    this.email,
    this.phoneNumbers,
    this.address,
    this.city,
    this.province,
    this.country,
    this.products,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        imageUrl: json["imageUrl"],
        name: json["name"],
        email: json["email"],
        phoneNumbers: json["phoneNumbers"] == null
            ? []
            : List<String>.from(json["phoneNumbers"]!.map((x) => x)),
        address: json["address"],
        city: json["city"],
        province: json["province"],
        country: json["country"],
        products: json["products"] == null
            ? []
            : List<dynamic>.from(json["products"]!.map((x) => x)),
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "name": name,
        "email": email,
        "phoneNumbers": phoneNumbers == null
            ? []
            : List<dynamic>.from(phoneNumbers!.map((x) => x)),
        "address": address,
        "city": city,
        "province": province,
        "country": country,
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
