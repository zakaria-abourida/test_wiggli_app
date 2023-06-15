import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wiggli_app/models/product.dart';
import 'package:test_wiggli_app/widgets/cart/counter_item_cart_widget.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context,) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(248, 250, 252, 1),
            borderRadius: BorderRadius.circular(7),
          ),
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: CachedNetworkImage(
            imageUrl: product.picture,
            imageBuilder: (context, imageProvider) => Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                shape: BoxShape.rectangle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: CupertinoActivityIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: SizedBox(
            // height: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 20.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  product.company,
                  style: TextStyle(
                      fontSize: 18.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(100, 116, 139, 1)),
                ),
                Text(
                  "${product.price} £",
                  style: TextStyle(
                      fontSize: 18.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(51, 65, 85, 1)),
                ),
              ],
            ),
          ),
        ),
        
        CounterItemCartWidget(product : product)
      ],
    );
  }
}
