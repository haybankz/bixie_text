import 'dart:convert';
import 'dart:io';

import 'package:bixie_text/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  group("Product", (){
    test("product.json is in assets/json folder",(){
      String jsonString;
      try {
        // Runs correctly on C.I/IDE (non relative path)
        jsonString = File('assets/json/product.json').readAsStringSync();
      } catch (e) {
        // Flutter 'test' tool for some reason wants a relative path
        jsonString = File('../assets/json/product.json').readAsStringSync();
      }
      expect(jsonString.isNotEmpty, true);
    });

    test("content of product.json is json", (){
      String jsonString;
      try {
        // Runs correctly on C.I/IDE (non relative path)
        jsonString = File('assets/json/product.json').readAsStringSync();
      } catch (e) {
        // Flutter 'test' tool for some reason wants a relative path
        jsonString = File('../assets/json/product.json').readAsStringSync();
      }
      expect(json.decode(jsonString)['name'], "Flat White");
    });

    test("get product object from product.json file", (){
      String jsonString;
      try {
        // Runs correctly on C.I/IDE (non relative path)
        jsonString = File('assets/json/product.json').readAsStringSync();
      } catch (e) {
        // Flutter 'test' tool for some reason wants a relative path
        jsonString = File('../assets/json/product.json').readAsStringSync();
      }

      Product product = Product.fromJson(json.decode(jsonString));
      expect(product.id, 14557);
    });
  });

}