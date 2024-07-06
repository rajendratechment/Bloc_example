import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../database/dao/products/ProductDao.dart';
import '../../models/Product.dart';

part 'local_db_state.dart';

class LocalDbCubit extends Cubit<LocalDbState> {
  final ProductDao productDao;

  LocalDbCubit(this.productDao) : super(LocalDbInitial());

  void getList() async {
    emit(LocalDbLoading());
    try {
      var list = productDao.readAll();
      emit(LocalDbLoaded(list));
    } catch (err) {
      emit(LocalDbError(err.toString()));
    }
  }
}
