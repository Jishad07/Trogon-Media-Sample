import 'dart:typed_data';

import 'package:get/get.dart';
import '../models/products_model.dart';
import '../services/product_service.dart';

class ProductViewModel extends GetxController {

  var productList = <Product>[].obs; 
  var isLoading = false.obs; 
  var errorMessage = ''.obs;
   var imageBytes = Rx<Uint8List?>(null);


  final ProductService productService;

 
  ProductViewModel(this.productService);

  // Fetch the products
  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      print("try working");
      // Fetch products from service
      List<Product> products = await productService.fetchProducts();
      productList.value = products;  // Update the product list
    } catch (e) {
      errorMessage.value = "Failed to load products: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
