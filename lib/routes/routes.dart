import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_wiggli_app/models/product.dart';
import 'package:test_wiggli_app/screens/cart_screen.dart';
import 'package:test_wiggli_app/screens/detail_screen.dart';
import 'package:test_wiggli_app/screens/home_screen.dart';
import 'package:test_wiggli_app/screens/tab_navigation_screen.dart';

const String routeInitial = 'home';

const String routeLogin = '/';
const String routeDetailProduct = 'DetailScreen:product';
const String routeCart = '/CartScreen';



final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKeyFaverates = GlobalKey<NavigatorState>();
final _sectionNavigatorKeyNotifications = GlobalKey<NavigatorState>();
final _sectionNavigatorKeyProfile = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
        // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
        return TabNavigationPage(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
                path: routeLogin,
                builder: (BuildContext context, GoRouterState state) {
                  return const HomeScreen();
                },
                routes: <RouteBase>[
                  // Add this branch routes
                  // each routes with its sub routes if available e.g shope/uuid/details
                  GoRoute(
                    name: routeDetailProduct,
                    path: routeDetailProduct,
                    builder: (BuildContext context, GoRouterState state) {
                      final productJson = state.pathParameters['product'];

                      final product =
                          Product.fromJson(json.decode(productJson!));
                      return DetailScreen(product: product);
                    },
                  ),
                ]),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKeyFaverates,
          routes: <RouteBase>[
            GoRoute(
                path: '/Faverates',
                builder: (BuildContext context, GoRouterState state) {
                  return  Scaffold(body :Container());
                },
               ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKeyProfile,
          routes: <RouteBase>[
            GoRoute(
                path: '/Profile',
                builder: (BuildContext context, GoRouterState state) {
                  return  Scaffold(body :Container());
                },
               ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKeyNotifications,
          routes: <RouteBase>[
            GoRoute(
                path: '/Notifications',
                builder: (BuildContext context, GoRouterState state) {
                  return  Scaffold(body :Container());
                },
               ),
          ],
        ),

        // The route branch for 2º Tab
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: routeCart,
      path: routeCart,
      builder: (BuildContext context, GoRouterState state) {
        return const CartScreen();
      },
    ),
  ],
);
