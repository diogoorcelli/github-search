import 'package:flutter/material.dart';
import 'package:test_near/src/features/presenter/pages/detail_page/widgets/user_detail_widget.dart';

class DetailUserPage extends StatelessWidget {
  const DetailUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map? args = ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Detalhes do Usuário')),
      ),
      body: UserDetailWidget(
        avatarUrl: args!['avatarUrl'],
        login: args['login'],
        id: 'Id: ${args['id']}',
        url: args['htmlUrl'],
      ),
    );
  }
}
