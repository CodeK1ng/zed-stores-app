// To parse this JSON data, do
//
//     final supplierResponse = supplierResponseFromJson(jsonString);

import 'dart:convert';

SupplierResponse supplierResponseFromJson(String str) =>
    SupplierResponse.fromJson(json.decode(str));

String supplierResponseToJson(SupplierResponse data) =>
    json.encode(data.toJson());

class SupplierResponse {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imageUrl;
  String? name;
  String? email;
  List<String>? phoneNumbers;
  String? address;
  String? city;
  String? province;
  String? country;
  List<Product>? products;

  SupplierResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.name,
    this.email,
    this.phoneNumbers,
    this.address,
    this.city,
    this.province,
    this.country,
    this.products,
  });

  factory SupplierResponse.fromJson(Map<String, dynamic> json) =>
      SupplierResponse(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  String? price;
  int? discount;
  int? stock;
  List<String>? imageUrls;
  String? salePrice;
  bool? sale;

  Product({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.stock,
    this.imageUrls,
    this.salePrice,
    this.sale,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
      };
}
