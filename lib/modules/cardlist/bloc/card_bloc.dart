import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../database/CardDao.dart';
import '../models/Card.dart';
import '../repo/CardRepo.dart';

part 'Card_event.dart';

part 'card_state.dart';

class CardBloc extends Bloc<CardLoadedEvent, CardState> {
  final ProductsRepo productRepo;
  final ProductDao dao = ProductDao.instance;

  CardBloc({required this.productRepo}) : super(CardLoadingState()) {
    on<CardLoadedEvent>((event, emit) async {
      try {
        emit(CardLoadingState());
        var data = await productRepo.getProduct();
        emit(CardLoadedState(data));
      } on SocketException {
        emit(CardOffline(dao.readAll()));
      } on ClientException {
        emit(CardOffline(dao.readAll()));
      } catch (err) {
        emit(CardErrorState(err.toString()));
      }
    });
  }
}
