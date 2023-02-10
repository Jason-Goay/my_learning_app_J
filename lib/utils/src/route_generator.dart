import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning_app/model/model.dart';
import 'package:my_learning_app/screen/screen.dart';
import 'package:my_learning_app/screen/src/cart_screen.dart';
import 'package:my_learning_app/screen/src/details_screen.dart';
import 'package:my_learning_app/screen/src/splash_screen.dart';

// class RouteGenerator {
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     WidgetBuilder builder;
//     switch (settings.name) {
//       case SplashScreen.routeName:
//         builder = (_) => SplashScreen();
//         break;
//       case HomeScreen.routeName:
//         builder = (_) => const HomeScreen();
//         break;
//       case DetailsScreen.routeName:
//         final product = settings.arguments as DetailsScreenArgument;
//         builder = (_) => DetailsScreen(
//               productArgument: product,
//             );
//         break;
//       default:
//         throw UnimplementedError();
//     }

//     return MaterialPageRoute(builder: builder);
//   }
// }

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
            name: 'homeScreen',
            path: 'home_screen',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
            routes: <RouteBase>[
              GoRoute(
                name: 'detailsScreen',
                path: 'details_screen',
                builder: (BuildContext context, GoRouterState state) {
                  DetailsScreenArgument args =
                      state.extra as DetailsScreenArgument;
                  return DetailsScreen(
                    productArgument: args,
                  );
                },
              ),
              GoRoute(
                name: 'cartScreen',
                path: 'cart_screen',
                builder: (BuildContext context, GoRouterState state) {
                  return CartScreen();
                },
              ),
            ]),
      ],
    ),
  ],
);
