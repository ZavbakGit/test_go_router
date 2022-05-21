import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //GoRouter.of(context).go('/page2');
            //context.go('/page2');
            context.goNamed('menu');
          },
          child: const Text('Go Page 2'),
        ),
      ),
    );
  }
}
