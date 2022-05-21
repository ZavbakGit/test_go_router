import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigTextTitle extends StatelessWidget {
  const BigTextTitle({super.key, required this.text});

  final String text;

  final gradient = const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        Color(0xff1a73e9),
        Color(0xff6b91f3),
      ]);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text,
          style: const TextStyle(
            fontSize: 32,
            fontFamily: "Inter",
            fontWeight: FontWeight.w900,
          )),
    );
  }
}
