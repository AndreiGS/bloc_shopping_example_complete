import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/cart/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Cart')),
      body: const ColoredBox(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO add an extension method in BuildContext to be able to use
    // context.textTheme.titleLarge or 
    // context.theme.textTheme.titleLarge or
    // context.titleLarge
    final itemNameStyle = Theme.of(context).textTheme.titleLarge;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return switch (state) {
          CartLoading() => const CircularProgressIndicator(),
          CartError() => const Text('Something went wrong!'),
          CartLoaded() => ListView.separated(
              itemCount: 0, // TODO: this is not true. Use the length of the cart
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final item = state.cart.items[index];
                return Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: ListTile(
                    leading: const Icon(Icons.done),
                    title: Text(item.name, style: itemNameStyle),
                    onLongPress: () {
                      // remove the item
                    },
                  ),
                );
              },
            ),
        };
      },
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final hugeStyle = TextStyle(); // TODO get the displayLarge from textTheme and use copyWith to set the fontSize to 48

    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return switch (state) {
                  CartLoading() => const SizedBox(), // TODO show a loading indicator and test that is is shown if CartLoaded/CartError are not emitted
                  CartError() => const Text('Something went wrong!'),
                  CartLoaded() =>
                    Text('\$${state.cart.totalPrice}', style: hugeStyle),
                };
              },
            ),
            const SizedBox(width: 24),
            ElevatedButton(
              onPressed: () {
                // TODO show a snackbar 'Buying not supported yet.'
              },
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
