import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          width: 360,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Column(
                children: [
                  Image.network(
                    "https://res.cloudinary.com/ginja-co-ltd/image/upload/s--zHcUzne6--/c_fill,h_300,q_jpegmini,w_485/v1/vendors/the-coffee-club-205/products/flat-white-mug-14557",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Flat White",
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Freshly grounded beans and steamed milk",
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
                          "\$ 125",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                        Text(
                          "1",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.2),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    child: RichText(
                        text: TextSpan(
                            text: "MILK OPTION",
                            style: TextStyle(
                              fontSize: 18,
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
                      "Please select 1 item",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.separated(itemBuilder: (_, index) => ListTile(title: Text("Option $index"),
                      onTap: (){},),
                          separatorBuilder: (_, index) => Divider(), itemCount: 3)
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.brown,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                            ),
                          ),

                          Text(
                            "\$ 125",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30
                  )
                ],
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.grey,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}