import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';
import 'models/item.dart';

void main() {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        },
      ),
      GoRoute(
        path: '/item',
        builder: (BuildContext context, GoRouterState state) {
          final Item item = state.extra as Item; 
          print("Navigating to item: ${item.name}"); // Debugging
          return ItemPage(item: item);
        },
      ),
    ],
  );

  runApp(
    MaterialApp.router(
       routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    ),
  );
}
