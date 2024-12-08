part of 'cart_bloc.dart';

@immutable
sealed class CartState extends Equatable {
  const CartState();
}

final class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

final class CartLoaded extends CartState {
  // TODO create the cart loaded state
}

final class CartError extends CartState {
  @override
  List<Object> get props => [];
}
