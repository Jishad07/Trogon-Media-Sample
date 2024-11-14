import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/products_model.dart';

class ProductService {
  final String baseUrl = 'https://fake-store-api.mock.beeceptor.com';
  final String productEndpoint = '/api/products';

  Future<List<Product>> fetchProducts() async {
   
    final apiUrl = "$baseUrl$productEndpoint";
    print('Requesting: $apiUrl'); // Debugging: Print the API URL

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        print("Status Code: 200 - Request successful");
        
        // Decode the JSON response
        List<dynamic> productJson = json.decode(response.body);
       print(productJson);
      
        if (productJson.isEmpty) {
          print("The product list is empty!");
        }

       
        return productJson.map((json) => Product.fromJson(json)).toList();
      } else {
       
        print("Error: Status code not 200");
        print('Response: ${response.body}');
        throw Exception('Failed to load products');
      }
    } catch (e) {
    
      print('Error fetching products: $e');
      throw Exception('Error fetching products');
    }
  }
}
