import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_wiggli_app/models/product.dart';
import 'package:test_wiggli_app/providers/product_provider.dart';
import 'package:test_wiggli_app/routes/routes.dart';

class ProductItemWidget extends ConsumerWidget {
  final Product product;
 const  ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refRead = ref.read(productProvider);

    return InkWell(
      onTap: () {
        context.pushNamed(routeDetailProduct,
            pathParameters: {'product': json.encode(product.toJson())});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 250.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: product.picture,
                imageBuilder: (context, imageProvider) => Container(
                  width: 250.w,
                  height: 250.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => SizedBox(
                    height: 250.w,
                    width: 250.w,
                    child: const CupertinoActivityIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                        fontSize: 22.sp,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.company,
                    style: TextStyle(
                        fontSize: 14.sp,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(100, 116, 139, 1)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price}',
                      style: TextStyle(
                          fontSize: 22.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
