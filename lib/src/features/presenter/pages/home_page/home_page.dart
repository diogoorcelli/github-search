import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_near/src/core/routes/app_named_routes.dart';
import 'package:test_near/src/features/presenter/pages/cubits/search_user_state.dart';

import '../../../../core/enums/default_search_status.dart';
import '../cubits/search_user_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.I<SearchUserCubit>();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Encontre Usuários do Github')),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 8.0,
                right: 8.0,
                bottom: 8.0,
              ),
              child: TextField(
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Buscar',
                ),
              ),
            ),
            BlocBuilder<SearchUserCubit, SearchUserState>(
              bloc: cubit,
              builder: (context, state) {
                if (state.status == DefaultStateStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.status == DefaultStateStatus.error) {
                  return const Center(
                    child: Text('Erro ao buscar usuários'),
                  );
                } else if (state.status == DefaultStateStatus.initial) {
                  return const Center(
                    child: Text('Digite o nome do usuário para consulta'),
                  );
                } else {
                  final list = (state.status == DefaultStateStatus.success)
                      ? state.searchUserEntityList
                      : [];
                  return Expanded(
                    child: ListView.builder(
                        itemCount: list.length >= 100 ? 100 : list.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppNamedRoutes.DETAILS_PAGE_ROUTE,
                                    arguments: {
                                      'avatarUrl': list[index].avatarUrl,
                                      'login': list[index].login,
                                      'id': list[index].id,
                                      'htmlUrl': list[index].htmlUrl,
                                    });
                              },
                              leading: list[index].avatarUrl == null
                                  ? Container()
                                  : CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(list[index].avatarUrl!),
                                    ),
                              title: Text('Nome: ${list[index].login!}'),
                              subtitle: Text(
                                  'Site admin: ${list[index].siteAdmin == true ? 'Sim' : 'Não'}'),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
          ],
        ));
  }

  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      context.read<SearchUserCubit>().searchUser(value);
    });
  }
}
