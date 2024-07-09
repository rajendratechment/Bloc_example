import 'package:flutter/material.dart';

import '../../cardlist/view/CardView.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
            child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CardList();
                }));
              },
              child: const Text('Login View'),
            ),



          ],
        )));
  }
}
