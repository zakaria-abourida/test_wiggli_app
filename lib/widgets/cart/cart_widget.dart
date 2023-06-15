import 'package:flutter/material.dart';
import 'package:test_wiggli_app/widgets/cart/cart_list_widget.dart';
import 'package:test_wiggli_app/widgets/cart/total_item_cart_widget.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
         CartListWidget(),
      
        TotalItemCartWidget()
      ],
    );
  }
}
