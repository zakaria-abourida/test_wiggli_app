import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_wiggli_app/routes/routes.dart';
import 'package:test_wiggli_app/widgets/home/text_field_search_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(125);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        backgroundColor: const  Color(0xffF5F5F5),
        centerTitle: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hello Ayoub",
                style: TextStyle(
                    fontSize: 25.0.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "What are you buying today ?",
                style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(100, 116, 139, 1)),
              ),
            ],
          ),
        ),
        elevation: 0,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 5),
              height: 50.r,
              width: 50.r,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(243, 249, 248, 1),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(icon: SvgPicture.asset("assets/icons/shopping-bag-03.svg"),
                  
                  
                  onPressed: (){
                    context.pushNamed(routeCart);
                  },
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 15.r,
                      width: 15.r,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(239, 68, 68, 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: TextFieldSearchWidget(
              readOnly: false,
              hint: "Search products ",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset("assets/icons/search-lg.svg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
