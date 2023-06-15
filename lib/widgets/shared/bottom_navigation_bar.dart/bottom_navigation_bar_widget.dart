import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_wiggli_app/widgets/shared/bottom_navigation_bar.dart/bottom_naviagation_bar_item_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final TabController controller;
  final void Function(int)? onTap;

  const BottomNavigationBarWidget(
      {super.key, required this.controller, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
      child: BottomAppBar(
        elevation: 1,
        child: SizedBox(
  
          height:  80.w,
          child: SafeArea(
            child: TabBar(
              indicatorWeight: 0.5,
              controller: controller,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const PointTabIndicator(
                insets: EdgeInsets.only(bottom: 8),
                position: PointTabIndicatorPosition.bottom,
                color: Color.fromRGBO(147, 51, 234, 1),
              ),
              onTap: onTap,
              tabs: [
                BottomNavigationBarItemWidget(
                  icon: SvgPicture.asset(
                    "assets/icons/home-line.svg",
                    color: const Color.fromRGBO(147, 51, 234, 1),
                  ),
                  title: "Home",
                ),
                BottomNavigationBarItemWidget(
                  icon: SvgPicture.asset(
                    "assets/icons/heart-rounded.svg",
                    color: const Color.fromRGBO(147, 51, 234, 1),
                  ),
                  title: "Favourites",
                ),
                BottomNavigationBarItemWidget(
                  icon: SvgPicture.asset(
                    "assets/icons/bell-01.svg",
                    color: const Color.fromRGBO(147, 51, 234, 1),
                  ),
                  title: "Notification",
                ),
                BottomNavigationBarItemWidget(
                  icon: SvgPicture.asset(
                    "assets/icons/user-03.svg",
                    color: const Color.fromRGBO(147, 51, 234, 1),
                  ),
                  title: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
