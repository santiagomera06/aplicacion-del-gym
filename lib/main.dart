// ignore: unused_import
import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:appgym/screens/copa.dart';
// ignore: unused_import
import 'package:appgym/screens/Desafios.dart';
// ignore: unused_import
import 'package:appgym/screens/ejecuciones_screen.dart';
// ignore: unused_import
import 'package:appgym/screens/ejercicios_principiante_screen.dart';
// ignore: unused_import
import 'package:appgym/screens/nivel_screen.dart';
// ignore: unused_import
import 'package:appgym/screens/numero_re_ser.dart';
// ignore: unused_import
import 'package:appgym/screens/temporizador.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: PantallaFelicitaciones(),
      //home: DesafiosScreen(),
      //home: PantallaEjecuciones(),
      //home: PantallaEjerciciosPrincipiante(),
      //home: PantallaNivel(),
      
      home: NumeroRepeticiones(),
      //home: Temporizador(),
    );
  }
}
