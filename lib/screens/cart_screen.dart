import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wiggli_app/widgets/cart/button_checkout_widget.dart';
import 'package:test_wiggli_app/widgets/cart/cart_widget.dart';
import 'package:test_wiggli_app/widgets/shared/app_bar_widget.dart';
import 'dart:io' show Platform;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Cart"),
      body: const ChartWidget(),
      bottomNavigationBar: SizedBox(
    
        height: Platform.isIOS ? 100.w : 70.w,
        child: const BottomAppBar(elevation: 20, child: ButtonCheckoutWidget()),
      ),
    );
  }
}
