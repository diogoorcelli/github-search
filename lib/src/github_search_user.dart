import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_near/src/core/routes/app_named_routes.dart';
import 'package:test_near/src/features/presenter/pages/cubits/search_user_cubit.dart';
import 'package:test_near/src/features/presenter/pages/home_page/home_page.dart';

import 'features/presenter/pages/detail_page/detail_user_page.dart';

class GithubSearchUser extends StatelessWidget {
  const GithubSearchUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SearchUserCubit>(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          initialRoute: AppNamedRoutes.HOME_ROUTE,
          routes: {
            AppNamedRoutes.HOME_ROUTE: (context) => const HomePage(),
            AppNamedRoutes.DETAILS_PAGE_ROUTE: (context) =>
                const DetailUserPage(),
          }),
    );
  }
}
