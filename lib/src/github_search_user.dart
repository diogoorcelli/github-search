import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_near/src/features/presenter/pages/home_page.dart';

import 'core/navigator/navigator_service.dart';
import 'features/presenter/pages/detail_user_page.dart';

class GithubSearchUser extends StatelessWidget {
  const GithubSearchUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: GetIt.I<NavigatorService>().navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (_) => const HomePage(),
              );
            default:
              return MaterialPageRoute(
                builder: (_) => const DetailUserPage(),
              );
          }
        });
  }
}
