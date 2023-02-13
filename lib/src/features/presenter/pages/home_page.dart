import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_near/src/features/presenter/pages/cubits/search_user_state.dart';

import '../../../core/enums/search_user_status.dart';
import 'cubits/search_user_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final searchUserCubit = GetIt.instance<SearchUserCubit>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Search Users'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SearchUserCubit>(
            create: (context) => GetIt.instance<SearchUserCubit>(),
          ),
        ],
        child: BlocBuilder<SearchUserCubit, SearchUserState>(
          builder: (context, state) {
            if (state.status == SearchUserStatus.initial) {
              return const Center(
                child: Text('Digite o nome para consulta'),
              );
            }
            if (state.status == SearchUserStatus.error) {
              return const Center(
                child: Text('Erro ao consultar'),
              );
            }
            if (state.status == SearchUserStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final list = state.searchUserEntityList;

            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
                  child: TextField(
                    onChanged: (value) {
                      context.read<SearchUserCubit>().searchUser(value);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite o nome para consulta',
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(list[index].login!),
                        );
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
