

import 'dart:convert';

import 'package:ecommerce_shop_api/model/product_model.dart';
import 'package:http/http.dart'as http;

class ApiService{
  static final client=http.Client();
  static Future<ProductModel?> getData()async{

    final url=Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json');
    final response=await client.get(url);
    final map=jsonDecode(response.body);
    if(response.statusCode==200){
      return ProductModel.fromJson(map);
    }
    else{
      return null;
    }

  }


}