import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarItemWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  const BottomNavigationBarItemWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      icon,
      const SizedBox(height: 5),
      Text(title,
          style: TextStyle(
              color: const Color.fromRGBO(147, 51, 234, 1),
              overflow: TextOverflow.ellipsis,
              fontSize: 12.sp))
    ]);
  }
}
