import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatelessWidget {
  Page2({Key? key}) : super(key: key);

  final List<String> listCofee =
      List.generate(50, (i) => i + 1).map((e) => 'Cofee $e').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      itemBuilder: (context, int index) {
        return ListTile(
          onTap: () {
            //context.go('/menu/${index.toString()}');
            context.goNamed('details', params: {'id': index.toString()});
          },
          title: Text(listCofee[index]),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: listCofee.length,
    ));
  }
}
