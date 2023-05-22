import 'package:ecomorce_app/screens/cart_page.dart';
import 'package:ecomorce_app/screens/details_page.dart';
import 'package:ecomorce_app/screens/home_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: "ECommerce App ",
      routes: {
        '/': (ctx) => const Home(),
        'detail': (ctx) => const Detailspage(),
        'cart': (ctx) => const cartpage()
      },
    ),
  );
}