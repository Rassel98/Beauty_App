import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

class ProductController extends GetxController {
  RxList productList = [].obs ;
  var isLoading=true.obs;
  //var productList=<ProductModel>[].obs;
  @override
  void onInit() {
    getApiData();
    // TODO: implement onInit
    super.onInit();
  }
//List productList=<ProductModel>[].obs ;

  Future<RxList> getApiData() async {
    isLoading(true);
    final url = Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    final response = await http.get(url);
    final map = jsonDecode(response.body);
    if (response.statusCode == 200) {

      for (var i in map) {
        productList.add(ProductModel.fromJson(i));
      }
      print(productList.length);
      isLoading(false);
      return productList;
    } else {
      isLoading(false);
      return productList;
    }
  }
}
