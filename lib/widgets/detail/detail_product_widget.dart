import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_wiggli_app/models/product.dart';

class DetailProductWidget extends StatelessWidget {
  final Product product;
  const DetailProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 360.w,
          pinned: true,
          floating: true,
          elevation: 0.0,
          titleSpacing: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            background: CachedNetworkImage(
              imageUrl: product.picture,
              imageBuilder: (context, imageProvider) => Container(
                width: 250.w,
                height: 250.w,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) =>
                  const Center(child: CupertinoActivityIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 15,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: Colors.white,
                ),
              )),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 20.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        product.company,
                        style: TextStyle(
                            fontSize: 18.sp,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(100, 116, 139, 1)),
                      ),
                    ],
                  ),
                  Text(
                    "${product.price} £",
                    style: TextStyle(
                        fontSize: 27.sp,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(51, 65, 85, 1)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .43,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/star-01.svg",
                        color: const Color.fromRGBO(252, 211, 77, 1)),
                    Text(
                      "4,4",
                      style: TextStyle(
                          fontSize: 16.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(100, 116, 139, 1)),
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.black,
                    ),
                    Text("109 Reviews",
                        style: TextStyle(
                            fontSize: 16.sp,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(14, 165, 233, 1))),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "About this item",
                style: TextStyle(
                  fontSize: 20.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.description,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(100, 116, 139, 1)),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
