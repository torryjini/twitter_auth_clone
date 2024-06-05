import 'package:flutter/material.dart';
import 'package:twitter_auth_clone/auth/sign_up_screen.dart';

void main() {
  runApp(const TwitterAuth());
}

class TwitterAuth extends StatelessWidget {
  const TwitterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Twitter Auth",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Color(0xff1D9BF0),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        primaryColor: const Color(0xff1D9BF0),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
        ),
      ),
      home: const SignUpScreen(),
    );
  }
}
