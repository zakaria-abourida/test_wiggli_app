import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_wiggli_app/widgets/home/app_bar_widget.dart';
import 'package:test_wiggli_app/widgets/home/home_widget.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreensState();
}

class _HomeScreensState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();


    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor:  Color(0xFFf5f5f5),
        appBar:  AppBarWidget(),
        body: HomeWidget(),
      
        );
  }
}
