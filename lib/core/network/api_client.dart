import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_endpoints.dart';
import '../../features/home/model/product_model.dart';

class ApiClient {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(ApiEndpoints.products));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
