import 'package:app_test_go_router/main.dart';
import 'package:app_test_go_router/widgets/big_text_title.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(248, 248, 248, 1),
                Color.fromARGB(255, 195, 228, 243),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: BigTextTitle(text: 'Авторизация'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(),
                      ),
                      TextField(
                        decoration: InputDecoration(),
                      ),
                      TextButton(
                        child: const Text('Login'),
                        onPressed: () {
                          loginInfo.isLoggedIn = true;
                          //context.goNamed('home');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
