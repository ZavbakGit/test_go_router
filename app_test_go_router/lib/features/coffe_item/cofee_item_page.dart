import 'package:flutter/material.dart';

class CoffeItemPage extends StatelessWidget {
  final int id;
  const CoffeItemPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Index: $id'),
      ),
    );
  }
}
