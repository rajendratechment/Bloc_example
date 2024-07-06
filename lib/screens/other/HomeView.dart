import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProductsView.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Productsview();
              }));
            },
            child: const Text('Product Screen'),
          ),
        ));
  }
}
