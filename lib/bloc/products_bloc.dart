import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/Product.dart';
import '../repo/ProductsRepo.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  final ProductsRepo productRepo;

  ProductsBloc(this.productRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var data = await productRepo.getProduct();
        emit(ProductsLoadedState(data));
      } catch (err) {
        emit(ProductsErrorState(err.toString()));
      }
    });
  }
}
