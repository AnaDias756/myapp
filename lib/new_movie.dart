import 'package:flutter/material.dart';

class NewMoviePage extends StatelessWidget {
  const NewMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Novo"), centerTitle: true),
      body: const Placeholder(),
    );
  }
}
