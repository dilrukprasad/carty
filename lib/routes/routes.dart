import 'package:carty/views/product_cart_view.dart';
import 'package:carty/views/product_details_view.dart';
import 'package:carty/models/product_model.dart';
import 'package:carty/views/product_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final goRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const CupertinoPage(
          child: ProductListView(),
        ),
      ),
      GoRoute(
        path: '/product',
        name: 'product',
        pageBuilder: (context, state) {
          Datum item = state.extra as Datum;
          return CupertinoPage(child: ProductDetailsView(product: item));
        },
      ),
      GoRoute(
        path: '/basket',
        pageBuilder: (context, state) => const CupertinoPage(
          child: CartView(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => const CupertinoPage(
      child: Scaffold(
        body: Center(
          child: Text('Page not found.'),
        ),
      ),
    ),
  );
}
