import 'package:flutter/material.dart';
import 'package:test_wiggli_app/models/product.dart';
import 'package:test_wiggli_app/widgets/shared/app_bar_widget.dart';
import 'package:test_wiggli_app/widgets/detail/detail_product_widget.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.white, 

      appBar: const AppBarWidget(
        title: "Product details",
        showCart: true,
      ),
      body: DetailProductWidget(product: widget.product),
    );
  }
}
