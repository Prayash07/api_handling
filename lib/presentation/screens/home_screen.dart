import 'package:api_handling/data/models/post_model.dart';
import 'package:api_handling/data/repositories/post_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API Handling"),
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
