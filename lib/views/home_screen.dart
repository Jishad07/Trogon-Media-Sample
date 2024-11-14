import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/build_category_section_widget.dart';
import '../services/product_service.dart';
import '../view_models/product_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ProductViewModel productViewModel =
      Get.put(ProductViewModel(ProductService()));

  @override
  Widget build(BuildContext context) {
    // Fetch products when the screen is initialized
    productViewModel.fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Homepage",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (productViewModel.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (productViewModel.errorMessage.value.isNotEmpty) {
            return Center(
              child: Text(
                productViewModel.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return ListView(
            children: [
             buildCategorySection("New Arrivals ,",productViewModel.productList, context, "new"),
              const SizedBox(height: 20),
              buildCategorySection("Trending Products",productViewModel.productList , context, "trending")
            ],
          );
        }),
      ),
    );
  }
}
