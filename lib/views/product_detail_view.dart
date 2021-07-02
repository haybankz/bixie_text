import 'package:bixie_text/models/product.dart';
import 'package:bixie_text/provider/product_provider.dart';
import 'package:bixie_text/views/widgets/counter.dart';
import 'package:bixie_text/views/widgets/extra_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  ProductDetailView({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          //take height of device
          height: MediaQuery.of(context).size.height,
          width: 768, //width breakpoint for tablet
          child: Stack(
            children: [
              Column(
                children: [
                  //product image
                  Image.network(
                    product.images?.fullSize ?? "",
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //product name
                  Text(
                    product.name ?? "",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),

                  SizedBox(
                    height: 6,
                  ),

                  //product description
                  Text(
                    product.fullDescription ?? "",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(
                    height: 6,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${product.price ?? 0}",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Counter(
                          onChanged: (value) {
                            context.read<ProductProvider>().setQuantity(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xffebe6e6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    child: RichText(
                        text: TextSpan(
                            text: "${product.extras?.first.name ?? ""}"
                                .toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            children: [
                          TextSpan(
                              text: " (REQUIRED)",
                              style: TextStyle(color: Colors.grey))
                        ])),
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xffdedede),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    child: Text(
                      "Please select ${product.extras?.first.max ?? "0"} item",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    //if max extraItem that can be selected is 1 use singleExtraItemsWidget else use MultipleExtraItemsWidget
                    child: int.parse(product.extras?.first.max ?? "0") <= 1
                        ? SingleExtraItemsWidget(
                            // maximumOption: 2,
                            options: product.extraItems ?? [],
                            onSelect: (value) {
                              context
                                  .read<ProductProvider>()
                                  .setExtraItem([value]);
                            },
                          )
                        : MultipleExtraItemsWidget(
                            maximumOption:
                                int.parse(product.extras?.first.max ?? "0"),
                            options: product.extraItems ?? [],
                            onSelect: (value) {
                              context
                                  .read<ProductProvider>()
                                  .setExtraItem(value);
                            }),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () {
                        List<ExtraItems> selectedItems =
                            context.read<ProductProvider>().extraItems;

                        if (selectedItems.length <
                            int.parse(product.extras?.first.min ?? "0")) {
                          Fluttertoast.showToast(
                              msg:
                                  "You must select at least ${product.extras?.first.min} items");
                          return;
                        }

                        if (selectedItems.length >
                            int.parse(product.extras?.first.max ?? "0")) {
                          Fluttertoast.showToast(
                              msg:
                                  "You can only select at most ${product.extras?.first.max} items");
                          return;
                        }

                        Navigator.pop(context);
                        Fluttertoast.showToast(msg: "Added to cart!!!");
                      },
                      color: Colors.brown,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),

                          ///listen to quantity
                          Text(
                            "ADD ${context.watch<ProductProvider>().quantity} TO CART",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "\$ ${context.watch<ProductProvider>().subTotal}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30)
                ],
              ),
              Positioned(
                top: 30,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
