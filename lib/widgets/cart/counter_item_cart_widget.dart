import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_wiggli_app/models/product.dart';
import 'package:test_wiggli_app/providers/product_provider.dart';



class CounterItemCartWidget extends ConsumerWidget {
  final Product product;
 const   CounterItemCartWidget({
    super.key,
    required this.product,
  });




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refWatch = ref.watch(productProvider);
    final refRead = ref.read(productProvider);

    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            refRead.removeProductFromCart(product);
          },
          child: Container(
            height: 38.r,
            width: 38.r,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade400, // Set the border color to blue
                width: 1.0, // Set the border width
                style: BorderStyle.solid, // Set the border style
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset("assets/icons/minus.svg",
                  color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            refWatch.countProduct(product).toString(),
            style: TextStyle(
                fontSize: 18.sp,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(51, 65, 85, 1)),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            refRead.addProductToCart(product);
          },
          child: Container(
            height: 38.r,
            width: 38.r,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 235, 226, 244),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset("assets/icons/plus.svg",
                  color: const Color.fromRGBO(147, 51, 234, 1)),
            ),
          ),
        ),
      ],
    );
  }
}
