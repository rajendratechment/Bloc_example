import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../database/ProductDao.dart';
import '../models/Product.dart';
import '../repo/ProductsRepo.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  final ProductsRepo productRepo;
  final ProductDao dao = ProductDao.instance;

  ProductsBloc({required this.productRepo}) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var data = await productRepo.getProduct();
        emit(ProductsLoadedState(data));
      } on SocketException {
        emit(ProductOffline(dao.readAll()));
      } on ClientException {
        emit(ProductOffline(dao.readAll()));
      } catch (err) {
        emit(ProductsErrorState(err.toString()));
      }
    });
  }
}
