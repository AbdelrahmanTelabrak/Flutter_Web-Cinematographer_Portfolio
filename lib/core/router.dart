// import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/pages/home_page.dart';
// import 'package:flutter/material.dart';
//
// import '../features/stills/presentation/pages/portfolio_page.dart';
// import '../features/stills/presentation/pages/still_details_page.dart';
// import 'consts/routes.dart';
//
// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case LATEST_PAGE:
//         return _GeneratePageRoute(
//             widget: const HomePage(), routeName: settings.name);
//       case PORTFOLIO_PAGE:
//         return _GeneratePageRoute(
//             widget: const PortfolioPage(), routeName: settings.name);
//       default:
//         return _GeneratePageRoute(
//             widget: const StillDetailsPage(), routeName: settings.name);
//     }
//   }
// }
//
// class _GeneratePageRoute extends PageRouteBuilder {
//   final Widget widget;
//   final String? routeName;
//
//   _GeneratePageRoute({required this.widget, this.routeName})
//       : super(
//           settings: RouteSettings(name: routeName),
//           pageBuilder: (BuildContext context, Animation<double> animation,
//               Animation<double> secondaryAnimation) {
//             return widget;
//           },
//           transitionDuration: const Duration(milliseconds: 500),
//           transitionsBuilder: (BuildContext context,
//               Animation<double> animation,
//               Animation<double> secondaryAnimation,
//               Widget child) {
//             return SlideTransition(
//               textDirection: TextDirection.rtl,
//               position: Tween<Offset>(
//                 begin: const Offset(1.0, 0.0),
//                 end: Offset.zero,
//               ).animate(animation),
//               child: child,
//             );
//           },
//         );
// }
