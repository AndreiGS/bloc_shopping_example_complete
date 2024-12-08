part of 'cart_bloc.dart';

@immutable
sealed class CartEvent extends Equatable {
  const CartEvent();
}

final class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

// Add an event CartItemAdded that receives the new item

final class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.item);

  final Item item;

  @override
  List<Object> get props => [item];
}
