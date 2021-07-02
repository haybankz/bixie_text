import 'package:bixie_text/models/product.dart';
import 'package:bixie_text/provider/product_provider.dart';
import 'package:bixie_text/views/home_view.dart';
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
        home: HomeView(),
      ),
    );
  }
}


