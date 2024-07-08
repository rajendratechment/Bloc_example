part of 'sign_bloc.dart';

sealed class SignState extends Equatable {
  const SignState();
}

final class SignInitial extends SignState {
  @override
  List<Object> get props => [];
}
