import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/catalog/catalog.dart';

class Cart extends Equatable {
  const Cart({this.items = const <Item>[]});

  final List<Item> items;

  int get totalPrice {
    // TODO calculate the total price with both for and functional programming (use either `fold` or any other function you prefer)
    return 0;
  }

  @override
  List<Object> get props => [items];
}
