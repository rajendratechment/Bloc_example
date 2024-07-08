import 'package:bloc_ar/modules/product/repo/ProductsRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'modules/home/view/HomeView.dart';
import 'modules/product/bloc/products_bloc.dart';

Future<void> main() async {
  // runApp(RepositoryProvider(
  //   create: (context) => ProductsRepo(),
  //   child: const MyApp(),
  // ));
  await dotenv.load(fileName: ".env"); //path to your .env file);
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
