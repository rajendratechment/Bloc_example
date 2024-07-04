import 'package:bloc_ar/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  Future<List<Product>> getProduct() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/'));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      throw Exception('http error code ${response.statusCode}');
    }
  }
}
