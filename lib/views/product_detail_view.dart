import 'package:bixie_text/models/product.dart';
import 'package:bixie_text/views/widgets/counter.dart';
import 'package:bixie_text/views/widgets/extra_items_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  ProductDetailView({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  product.images?.fullSize ?? "",
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  product.name ?? "",
                  style: TextStyle(color: Colors.black87, fontSize: 18,
                  fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  product.description ?? "",
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${product.price ?? 0}",
                        style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Counter(
                          onChanged: (value) {
                            print(value);
                          },
                          max: 4),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: RichText(
                      text: TextSpan(
                          text: "${product.extras?[0].name ?? ""}".toUpperCase(),
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
                  color: Colors.grey.withOpacity(0.5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  child: Text(
                    "Please select ${product.extras?[0].max ?? "0"} item",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleExtraItemsWidget(
                    // maximumOption: 2,
                    options: product.extraItems?.map((e) => e.name).toList() ?? [],
                    onSelect: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    onPressed: () {},
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
                        Text(
                          "ADD 1 TO CART",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\$ 125",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
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
                onTap: (){
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
    );
  }
}

