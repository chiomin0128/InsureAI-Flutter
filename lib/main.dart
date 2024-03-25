import 'package:flutter/material.dart';
import 'layout/Navigation.dart'; // Navigation 위젯을 정의한 파일을 임포트합니다.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 앱의 기본 테마를 정의합니다.
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
