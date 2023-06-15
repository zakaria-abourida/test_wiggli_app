import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_wiggli_app/routes/routes.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  final String title ;
  final bool  showCart ;
  const AppBarWidget({Key? key, required this.title,  this.showCart = false}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        backgroundColor: const  Color(0xffF5F5F5),
        centerTitle: true,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
           title,
            style: TextStyle(
                fontSize: 25.0.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
        elevation: 0,
                actions: [
          Visibility(
            visible: showCart,
            child: Container(
              margin: const  EdgeInsets.only(right: 5),
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
                  ),                    Positioned(
                      right:10,
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
                )),
          )
        ],
  
        leading: Container(
          alignment: Alignment.centerRight,
          // color: Colors.red,
          child: IconButton(
            // padding: const EdgeInsets.only(top: 10),
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => {context.pop()},
          ),
        ),
  ),
    );
  }
}
