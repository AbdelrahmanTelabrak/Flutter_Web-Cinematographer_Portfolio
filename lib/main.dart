import 'package:ahmed_abdelrehim_portfolio/core/consts/routes.dart';
import 'package:ahmed_abdelrehim_portfolio/core/theme/themes.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/pages/home_page.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/pages/portfolio_page.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/pages/still_details_page.dart';
import 'package:ahmed_abdelrehim_portfolio/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '$PORTFOLIO_PAGE',
          builder: (context, state) => const PortfolioPage(),
        ),
        GoRoute(
          path: '$PORTFOLIO_PAGE/:id',
          builder: (context, state) => StillDetailsPage(id: state.pathParameters['id']!,),
        ),
        GoRoute(
          path: '$LATEST_PAGE',
          builder: (context, state) => const HomePage(),
        ),    
      ],
      routerNeglect: false,
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
