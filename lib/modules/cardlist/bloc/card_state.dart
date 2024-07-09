part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

class CardLoadingState extends CardState {}

class CardLoadedState extends CardState {
  final List<Product> product;

  const CardLoadedState(this.product);

  @override
  List<Object> get props => [product];
}

class CardErrorState extends CardState {
  final String errorMessage;

  const CardErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CardOffline extends CardState {
  final Future<List<Product>> product;

  const CardOffline(this.product);
}
