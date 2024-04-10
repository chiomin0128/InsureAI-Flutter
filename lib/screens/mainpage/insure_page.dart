import 'package:flutter/material.dart';
class InsurePage extends StatelessWidget {
  const InsurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InsurePage'),
      ),
      body: const Center(
        child: Text('InsurePage', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
