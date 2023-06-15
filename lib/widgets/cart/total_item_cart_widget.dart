import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wiggli_app/providers/product_provider.dart';

class TotalItemCartWidget extends ConsumerWidget {
 const  TotalItemCartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refWatch = ref.watch(productProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Divider(
            color: Color.fromRGBO(229, 231, 235, 1),
            thickness: 1,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub total",
                style: TextStyle(
                    fontSize: 20.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(100, 116, 139, 1)),
              ),
              Text(
                '${refWatch.getTotalPrice()} £',
                style: TextStyle(
                  fontSize: 20.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery cost",
                style: TextStyle(
                    fontSize: 20.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(100, 116, 139, 1)),
              ),
              Text(
                "23 £",
                style: TextStyle(
                  fontSize: 20.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Voucher Discount",
                style: TextStyle(
                    fontSize: 20.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(100, 116, 139, 1)),
              ),
              Text(
                "-15 % £",
                style: TextStyle(
                    fontSize: 20.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const DottedLine(
            dashLength: 10.0,
            dashColor: Color.fromRGBO(229, 231, 235, 1),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Totale",
                style: TextStyle(
                    fontSize: 25.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(100, 116, 139, 1)),
              ),
              Text(
                '${refWatch.getTotalPriceWithDelevryCost()} £',
                style: TextStyle(
                  fontSize: 25.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),


                    const SizedBox(height: 20),

        ],
      ),
    );
  }
}
