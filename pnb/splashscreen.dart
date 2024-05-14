import 'package:flutter/material.dart';
import 'dart:async';
import 'mainpage_widget.dart'; // 메인 화면 위젯을 임포트합니다.

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainpageWidget())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
          child: Image.asset('assets/logo.png') // 로고 이미지를 중앙에 표시
      ),
    );
  }
}
