part of 'local_db_cubit.dart';

@immutable
sealed class LocalDbState {}

final class LocalDbInitial extends LocalDbState {}

final class LocalDbLoading extends LocalDbState {}

final class LocalDbError extends LocalDbState {
  final String message;

  LocalDbError(this.message);
}

final class LocalDbLoaded extends LocalDbState {
  final Future<List<Product>> list;


  LocalDbLoaded(this.list);
}
