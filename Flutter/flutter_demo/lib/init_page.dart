import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart'; // Import trang login

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Chờ 1 giây, rồi chuyển sang LoginPage với hiệu ứng slide
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          // Độ dài animation, 700ms

          pageBuilder: (context, animation, secondaryAnimation) {
            return const LoginPage();
          },
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            // Ở đây ta định nghĩa hiệu ứng slide
            const begin = Offset(1.0, 0.0); // bắt đầu từ bên phải màn hình
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(
              tween.chain(CurveTween(curve: Curves.easeInOut)),
            );

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1F3D85), // nền xanh
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/sam_academy.png',
          width: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
