import 'package:flutter/material.dart';
import 'screens/ejercicios_principiante_screen.dart';
import 'screens/nivel_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NivelScreen(),
      routes: {
        '/ejercicios_principiante': (context) => const EjerciciosPrincipianteScreen(),
      },
    );
  }
}