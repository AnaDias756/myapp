
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importe o firebase_core
import 'package:myapp/home_page.dart';
import 'package:myapp/new_movie.dart';
import 'firebase_options.dart'; // Importe o arquivo de configuração do Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o Flutter esteja inicializado
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Inicializa o Firebase
  );
  runApp(const MyApp()); // Inicia o aplicativo
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ana',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
      routes: {"/new": (context) => const NewMoviePage()},
    );
  }
}
