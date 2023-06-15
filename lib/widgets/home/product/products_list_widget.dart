import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wiggli_app/models/product.dart';
import 'package:test_wiggli_app/widgets/home/product/product_item_widget.dart';

class ProductsListWidget extends StatelessWidget {
  final List<Product> products;
  final String title;
  const ProductsListWidget(
      {super.key, required this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 18.sp,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(126, 34, 206, 1)),
                  )
                ])),
        const SizedBox(height: 20),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400.w,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductItemWidget(product: products[index],);
                })),
      ],
    );
  }
}
