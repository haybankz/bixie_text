import 'package:bixie_text/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {

  ///list to hold selected extra items
  List<ExtraItems> _extraItems = [];
  ///to hold the value of subtotal
  int _subTotal = 0;
  ///to hold the value price of the product itself
  int _productPrice = 0;
  ///to hold the value of the
  int _quantity = 1;

  ///getter variables
  List<ExtraItems> get extraItems => _extraItems;
  int get subTotal => _subTotal;
  int get productPrice => _productPrice;
  int get quantity => _quantity;

  ///set extra item selected
  ///sets the list of extra items selected, to be added to the product
  setExtraItem(List<ExtraItems> extras){
    _extraItems = extras;
   _calculateSubTotal();
  }

  ///set quantity of product
  ///sets the quantity of the product that should be added to cart
  setQuantity(int quantity){
    _quantity = quantity;
    _calculateSubTotal();
  }

  ///set the price of  product
  ///sets the initial price of the product i.e price of the products before extra items are being selected
  setProductPrice(int price){
    _productPrice = price;
    _subTotal = _productPrice;
    _calculateSubTotal();
  }

  ///calculates subtotal
  ///
  ///adds the price of the product and the sum of selected extra items multiplied by the quantity
  void _calculateSubTotal(){
    // calculate price of one product
    ///List.fold calculates the sum pf prices of items in the _extraItems list
     int priceOfProduct = _productPrice + _extraItems.fold(0, (sum, item) => sum + int.parse(item.price ?? "0"));

     //subtotal is price of product multiplied by the quantity
    _subTotal =  priceOfProduct * _quantity;
    notifyListeners();
  }








}