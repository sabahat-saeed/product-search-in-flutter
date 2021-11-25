import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsList {
  String title;
  String imageUrl;
  ProductsList({this.imageUrl, this.title});
}

class ProductsSearchProvider with ChangeNotifier {
  List<ProductsList> _productsList = [];

  List<ProductsList> get productsList {
    return [..._productsList];
  }

  /*void appendList(List<String> list) {
    _productsList.addAll(list);
    notifyListeners();
  }*/

  Future<void> fetchByProductsList() async {
    const url = 'use your api link here';
    try {
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      _productsList.clear();
      data.forEach((key, value) {
        _productsList.add(ProductsList(
          title: value['title'],
          imageUrl:
              'use your images file link here/${value["image"]}',
        ));
      });
    } catch (error) {
      throw error;
    }

    notifyListeners();
  }
}
