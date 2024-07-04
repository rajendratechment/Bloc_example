import 'package:bloc_ar/bloc/products_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Productsview extends StatefulWidget {
  const Productsview({super.key});

  @override
  State<Productsview> createState() => _StatefulWidgetState();
}

class _StatefulWidgetState extends State<Productsview> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Screen'),
        ),
        body:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductsLoadedState) {
            return Center(
              child: ListView.builder(
                itemCount: state.product.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('${state.product[index].category}'),
                  );
                },
              ),
            );
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        }));
  }
}
