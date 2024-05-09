// Function to fetch products from the firstore database
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed_stores/core/constants/api-configs.dart';
import 'package:zed_stores/services/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:zed_stores/services/models/supplier.dart';

Future<List<ProductResponse>> fetchProducts() async {
  final response = await http.get(Uri.parse('${apiBaseUrl}/products'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> jsonList = json.decode(response.body);

    // Convert the dynamic list to a list of ProductResponse
    List<ProductResponse> products =
        jsonList.map((json) => ProductResponse.fromJson(json)).toList();

    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch products');
  }
}

Future<List<SupplierResponse>> fetchSuppliers() async {
  final response = await http.get(Uri.parse('${apiBaseUrl}/suppliers'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> jsonList = json.decode(response.body);

    // Convert the dynamic list to a list of Supplier
    List<SupplierResponse> suppliers =
        jsonList.map((json) => SupplierResponse.fromJson(json)).toList();

    return suppliers;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch suppliers');
  }
}
