import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_wiggli_app/providers/product_provider.dart';
import 'package:test_wiggli_app/widgets/home/product/products_list_widget.dart';
import 'package:test_wiggli_app/widgets/home/categorie/categories_list_widget.dart';

class HomeWidget extends ConsumerWidget {
 const  HomeWidget({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refWatch = ref.watch(productProvider);

    return Column(
      children: [
       
        Expanded(
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              CategoriesListWidget(categories: refWatch.categories),
              const SizedBox(
                height: 15,
              ),
              ProductsListWidget(
                  products: refWatch.productsListOne, title: 'Trending sales'),
              const SizedBox(
                height: 15,
              ),
              ProductsListWidget(
                  products: refWatch.productsListTow, title: 'New arrivals'),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
