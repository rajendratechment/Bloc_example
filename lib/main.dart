import 'package:bloc_ar/bloc/CounterCubit.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bloc Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterCubit counterCubit = CounterCubit();

  void _incrementCounter() {
    setState(() {
      counterCubit.increment();
    });
  }
  void _decrementCounter() {
    setState(() {
      counterCubit.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${counterCubit.state};',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Column(
              children: [
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.add),
                  onPressed: _incrementCounter,
                ),
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.minimize),
                  onPressed: _decrementCounter,
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}
