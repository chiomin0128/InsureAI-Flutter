import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'widget/navigation.dart'; // Navigation 위젯을 정의한 파일을 임포트합니다.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,        
      ],
      supportedLocales: const [
        Locale('ko','KO'),
      ],
      locale: const Locale('ko'),
      theme: ThemeData(
        // 앱의 기본 테마를 정의합니다.
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
