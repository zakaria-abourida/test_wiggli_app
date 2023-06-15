import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_wiggli_app/providers/product_provider.dart';
import 'package:test_wiggli_app/widgets/cart/cart_item_widget.dart';

class CartListWidget extends ConsumerWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refWatch = ref.watch(productProvider);
    return Expanded(
      child: Builder(builder: (context) {
        if (refWatch.productsListCart.isEmpty) {
          return const Center(child: Text("empty list"));
        }
        return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: refWatch.productsListCartDistinct.length,
            itemBuilder: (context, index) {
              return CartItemWidget(product: refWatch.productsListCartDistinct[index]);
            });
      }),
    );
  }
}
