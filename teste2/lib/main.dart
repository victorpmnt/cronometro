import 'package:flutter/material.dart';
import 'cronometro/pagina_cronometro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Cronometro',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 183, 104, 58)),
      useMaterial3: true,
    ),
    home: const MyHomePage(),
    );
  }
}

