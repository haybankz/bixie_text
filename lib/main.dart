import 'package:bixie_text/models/product.dart';
import 'package:bixie_text/provider/product_provider.dart';
import 'package:bixie_text/views/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Bixie Test',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: HomePage(),
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
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
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(products[index].name!),
          subtitle: Text(products[index].description!),
          leading: Image.network("${products[index].images?.thumbnail ?? ""}"),
          onTap: (){
            context.read<ProductProvider>().setProductPrice(products[index].price!);
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailView(
              product: products[index],
            )));
          },
        ),
      ),
    );
  }
}
