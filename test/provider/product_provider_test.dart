import 'package:bixie_text/models/product.dart';
import 'package:bixie_text/provider/product_provider.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  group("Product Provider", (){

    test("set product price function is working", (){
      var provider = ProductProvider();
      provider.setProductPrice(30);
      expect(provider.productPrice == 30 && provider.subTotal == 30, true);

    });

    test("set extra item function is working", (){
      var provider = ProductProvider();
      provider.setExtraItem([ExtraItems()]);
      expect(provider.extraItems.length, 1);
    });

    test("set quantity function is working", (){
      var provider = ProductProvider();
      provider.setQuantity(10);
      expect(provider.quantity, 10);
    });

    test("calculate subTotal function is working", (){
      var provider = ProductProvider();
      provider.setProductPrice(100);
      provider.setQuantity(2);
      provider.setExtraItem([ExtraItems(name: "test", price: "10"), ExtraItems(name: "test", price: "5")]);
      expect(provider.subTotal, 230);
    });
  });
}