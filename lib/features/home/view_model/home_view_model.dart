import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import '../../../core/network/api_client.dart';
import '../model/product_model.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiClient _api = ApiClient();

  bool isLoading = false;
  String? error;
  List<ProductModel> products = [];

  HomeViewModel() {
    init();
  }

  init() async {
    await fetchProducts();
  }

  Future<void> fetchProducts() async {
    if (isLoading) return;

    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final stopwatch = Stopwatch()..start();

      final response = await _api.fetchProducts().timeout(
        const Duration(seconds: 15),
      );

      stopwatch.stop();

      // Ensure shimmer shows at least 4 seconds
      if (stopwatch.elapsed.inSeconds < 4) {
        await Future.delayed(
          Duration(seconds: 4 - stopwatch.elapsed.inSeconds),
        );
      }

      if (response.isEmpty) {
        error = "No products available";
        products = [];
      } else {
        products = response;
      }
    } on TimeoutException {
      error = "Request timed out. Please try again.";
    } on SocketException {
      error = "No internet connection.";
    } catch (e) {
      error = "Something went wrong.";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
