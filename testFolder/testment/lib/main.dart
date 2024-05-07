import 'package:flutter/material.dart';
import 'package:testment/InputPage.dart';

// 클라이언트의 시작점. InputPage부터 시작
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage()
    );
  }
}
