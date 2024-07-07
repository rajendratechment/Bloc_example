import 'package:bloc_ar/bloc/products/products_bloc.dart';
import 'package:bloc_ar/database/dao/products/ProductDao.dart';
import 'package:bloc_ar/repo/ProductsRepo.dart';
import 'package:bloc_ar/screens/other/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // runApp(RepositoryProvider(
  //   create: (context) => ProductsRepo(),
  //   child: const MyApp(),
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(productRepo: ProductsRepo()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
