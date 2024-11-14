


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';
import '../view_models/product_viewmodel.dart';
import '../views/product_details_screen.dart';
import 'product_card_widget.dart';

Widget buildCategorySection(
   String title,  
   RxList<Product> productList,
    BuildContext context,
    String s
 ) {
  // Access the ProductViewModel using Get.find()
  final ProductViewModel productViewModel = Get.find<ProductViewModel>();
   final screenHeight=MediaQuery.of(context).size.height;
   final screenWidth=MediaQuery.of(context).size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Category Title
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      // Horizontal Product List
      SizedBox(
        height:screenHeight*0.37, // You can adjust this height as needed
        child: Obx(() {
          // Show a loading indicator while the data is loading
          if (productViewModel.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          // Handle if the product list is empty
          if (productViewModel.productList.isEmpty) {
            return Center(child: Text("No products available."));
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productViewModel.productList.length,
            itemBuilder: (context, index) {
              final product = productViewModel.productList[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to product details page when a product is tapped
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ProductDetailsPage(product: product)));
                  // Get.to(() => ProductDetailsPage(product: product)); // Use Get.to() for navigation
                },
                child: buildProductCard(product: product), // Pass product data to ProductCardWidget
              );
            },
          );
        }),
      ),
    ],
  );
}


