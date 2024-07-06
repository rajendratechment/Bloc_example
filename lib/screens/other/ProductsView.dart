import 'package:bloc_ar/bloc/products/products_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/local_db/local_db_cubit.dart';
import '../../models/Product.dart';

class Productsview extends StatefulWidget {
  const Productsview({super.key});

  @override
  State<Productsview> createState() => _StatefulWidgetState();
}

class _StatefulWidgetState extends State<Productsview> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    context.read<LocalDbCubit>().getList();
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
                child: Column(
              children: [
                CircularProgressIndicator.adaptive(),
                Text('retrieving  from the server')
              ],
            ));
          } else if (state is ProductsLoadedState) {
            return Center(
              child: ListView.builder(
                itemCount: state.product.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Text('${state.product[index].title?.substring(0, 3)}'),
                  );
                },
              ),
            );
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is ProductOffline) {
            return Center(
              child: BlocBuilder<LocalDbCubit, LocalDbState>(
                  builder: (context, state) {
                if (state is LocalDbLoaded) {
                  return Center(
                    child: FutureBuilder<List<Product>>(
                        future: state.list,
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text(
                                    '${snapshot.data?[index].title?.substring(0, 3)}'),
                              );
                            },
                          );
                        }),
                  );
                } else if (state is LocalDbLoading) {
                  return const Column(
                      children: [
                        CircularProgressIndicator.adaptive(),
                        Text('retrieving  from the local db')
                      ]
                  );
                }
                return const Center(
                  child: SizedBox(),
                );
              }),
            );
          }

          return const SizedBox();
        }));
  }
}
