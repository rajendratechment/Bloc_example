import 'package:bloc_ar/database/dao/products/ProductDao.dart';
import 'package:bloc_ar/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  ProductDao dao = ProductDao.instance;

  Future<List<Product>> getProduct() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/'));
    if (response.statusCode == 200) {
      List<Product> productList = productFromJson(response.body);
      for (int i = 0; i < productList.length; i++) {
        var pro = productList[i];
        dao.create(pro);
      }
      return productList;
    } else {
      throw Exception('http error code ${response.statusCode}');
    }
  }
}
