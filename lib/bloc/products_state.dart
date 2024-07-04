part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  //  avoid to write the boiler plate code, if the same  data is coming from the server then no need to chang the state
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<Product> product;

  const ProductsLoadedState(this.product);
  @override
  List<Object> get props => [product];
}

class ProductsErrorState extends ProductsState {
  final String errorMessage ;

  const ProductsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

}
