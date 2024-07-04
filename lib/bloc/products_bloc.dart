import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var response =
            await http.get(Uri.parse('https://fakestoreapi.com/products/'));
        if (response.statusCode == 200) {
          emit(ProductsLoadedState(productFromJson(response.body)));
        } else {
          throw Exception('http error code ${response.statusCode}');
        }
      } catch (err) {
        emit(ProductsErrorState(err.toString()));
      }
    });
  }
}
