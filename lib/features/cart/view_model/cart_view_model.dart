import 'package:flutter/material.dart';
import 'package:get_x/get_utils/src/extensions/internacionalization.dart';
import 'package:mini_store_app/core/widgets/custom_snakbar.dart';
import '../../home/model/product_model.dart';

class CartViewModel extends ChangeNotifier {
  /// Private cart list (Best Practice)
  final List<ProductModel> _cartItems = [];

  /// Public getter
  List<ProductModel> get cartItems => _cartItems;

  /// Loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Check if item already exists in cart
  bool isInCart(ProductModel product) {
    return _cartItems.any((item) => item.id == product.id);
  }

  /// Add to cart with loading & snackbar
  Future<void> addToCartWithFeedback(ProductModel product) async {
    if (_isLoading) return;

    _setLoading(true);

    await Future.delayed(const Duration(milliseconds: 500));

    if (isInCart(product)) {
      CustomSnackBar().showSnackbar('item_already_in_cart'.tr);
    } else {
      _cartItems.add(product);
      notifyListeners();

      CustomSnackBar().showSnackbar('added_to_the_cart'.tr);

      debugPrint("------ CART DATA ------");
      for (var item in _cartItems) {
        debugPrint(
          "ID: ${item.id}, Title: ${item.title}, Price: ${item.price}",
        );
      }
      debugPrint("-----------------------");
    }

    _setLoading(false);
  }

  /// Remove item safely
  void removeFromCart(ProductModel product) {
    _cartItems.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  /// Clear entire cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  /// Get total price
  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));
  }

  /// Get cart count
  int get cartCount => _cartItems.length;
}
