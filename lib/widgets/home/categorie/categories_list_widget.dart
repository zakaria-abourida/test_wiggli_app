import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wiggli_app/models/categorie.dart';
import 'package:test_wiggli_app/widgets/home/categorie/categorie_item_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  final List<Categorie> categories;
  const CategoriesListWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 45.w,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategorieItemWidget(categorie: categories[index],selected:index ==0 ?true : false,);
            }));
  }
}
