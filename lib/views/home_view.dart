
import 'package:bixie_text/models/product.dart';
import 'package:bixie_text/provider/product_provider.dart';
import 'package:bixie_text/views/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 10), () async {
      Product product = await getProduct(context);
      setState(() {
        products = [product, product, product];
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Rosie Cafe"),
      ),
      body: ListView.separated(
        itemCount: products.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(products[index].name!, style:TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(products[index].description!),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network("${products[index].images?.thumbnail ?? ""}"),
          ),
          onTap: (){
            context.read<ProductProvider>().setProductPrice(products[index].price!);

            Navigator.push(context, MaterialPageRoute(builder: (_) =>
                ProductDetailView(
                  product: products[index],
                ),),);
          },
        ),
        separatorBuilder: (_, index) => Divider(color: Colors.grey, height: 1,),
      ),
    );
  }
}