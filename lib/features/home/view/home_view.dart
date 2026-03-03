import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_utils/src/extensions/internacionalization.dart';
import 'package:mini_store_app/core/widgets/item_custom_card.dart';
import 'package:mini_store_app/core/widgets/splash_shimmer.dart';
import 'package:mini_store_app/features/cart/view/cart_screen.dart';
import 'package:mini_store_app/features/cart/view_model/cart_view_model.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';
import '../../product_details/view/product_details_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (BuildContext context, vm, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("dashboard".tr),
            backgroundColor: Colors.blueAccent,
            automaticallyImplyLeading: false,
            actions: [
              Consumer<CartViewModel>(
                builder: (context, cartVM, _) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Stack(
                      clipBehavior: Clip.none, // allow badge to overflow
                      children: [
                        IconButton(
                          icon: const Icon(Icons.shopping_cart, size: 28),
                          onPressed: () {
                            Get.to(() => CartScreen());
                          },
                        ),
                        if (cartVM.cartItems.isNotEmpty)
                          Positioned(
                            right: 4,
                            top: 4,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '${cartVM.cartItems.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          body: vm.isLoading
              ? const ProductGridShimmer()
              : vm.error != null
              ? Center(child: Text(vm.error!))
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: vm.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (_, index) {
                    final product = vm.products[index];

                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
