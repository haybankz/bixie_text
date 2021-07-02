import 'package:bixie_text/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {

  setProductPrice(int price){

    _productPrice = price;
    _subTotal = _productPrice;
    _calculateSubTotal();
  }

  List<ExtraItems> _extraItems = [];
  int _subTotal = 0;
  int _productPrice = 0;
  int _quantity = 1;

  List<ExtraItems> get extraItems => _extraItems;
  int get subTotal => _subTotal;
  int get productPrice => _productPrice;
  int get quantity => _quantity;

  setExtraItem(List<ExtraItems> extras){
    _extraItems = extras;
   _calculateSubTotal();
  }

  setQuantity(int quantity){
    _quantity = quantity;
    _calculateSubTotal();
  }

  void _calculateSubTotal(){
    _subTotal = (_productPrice * _quantity) + _extraItems.fold(0, (sum, item) => sum + int.parse(item.price ?? "0"));
    notifyListeners();
  }






}