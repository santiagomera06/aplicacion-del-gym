// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';

// Widget que representa un temporizador.
class Temporizador extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TemporizadorState createState() => _TemporizadorState();
}

class _TemporizadorState extends State<Temporizador> {
  bool isPlaying = false; // Variable para controlar si el temporizador está en marcha.
  Duration tiempoTranscurrido = Duration.zero; // Variable para almacenar el tiempo transcurrido.
  Timer? _timer; // Variable para el temporizador.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Color de fondo negro.
      body: SafeArea( // SafeArea para evitar que el contenido se superponga a la barra de estado.
        child: Column( // Columna principal que contiene todos los elementos.
          crossAxisAlignment: CrossAxisAlignment.stretch, // Los elementos se estiran horizontalmente.
          children: [
            // Barra de título verde con imagen
            Container(
              color: Colors.green, // Color de fondo verde.
              padding: const EdgeInsets.all(16.0), // Padding interno.
              child: const Row( // Fila para la imagen y el título.
                children: [
                  // Image.asset(
                  //   'assets/plancha_ejercicio.png', // Reemplaza con la ruta de tu imagen
                  //   width: 80,
                  //   height: 80,
                  // ), // Comentado: Se debe reemplazar con la ruta correcta de la imagen.
                  SizedBox(width: 16), // Espacio entre la imagen y el título.
                  Text(
                    'Plancha', // Título del ejercicio.
                    style: TextStyle(
                      color: Colors.white, // Color de texto blanco.
                      fontSize: 20, // Tamaño de fuente 20.
                      fontWeight: FontWeight.bold, // Texto en negrita.
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16), // Espacio vertical.

            // Contenedor "En ejecución"
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0), // Margen horizontal.
              padding: const EdgeInsets.all(8.0), // Padding interno.
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.5), // Color de fondo verde semi-transparente.
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados.
              ),
              child: const Center( // Texto centrado.
                child: Text(
                  'En ejecución', // Texto "En ejecución".
                  style: TextStyle(color: Colors.white), // Color de texto blanco.
                ),
              ),
            ),

            const SizedBox(height: 16), // Espacio vertical.

            // Contenedor del cronómetro
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0), // Margen horizontal.
              padding: const EdgeInsets.all(16.0), // Padding interno.
              decoration: BoxDecoration(
                color: Colors.grey[900], // Color de fondo gris oscuro.
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados.
              ),
              child: Center( // Texto centrado.
                child: Text(
                  _formatDuration(tiempoTranscurrido), // Formatea el tiempo transcurrido.
                  style: const TextStyle(
                    color: Colors.white, // Color de texto blanco.
                    fontSize: 40, // Tamaño de fuente 40.
                    fontWeight: FontWeight.bold, // Texto en negrita.
                  ),
                ),
              ),
            ),

            const Spacer(), // Espacio flexible para empujar la barra de control al final.

            // Barra de control de reproducción
            Container(
              color: const Color.fromARGB(255, 159, 17, 17), // Color de fondo rojo.
              padding: const EdgeInsets.all(8.0), // Padding interno.
              child: Row( // Fila para los botones de control.
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Espacio entre los botones.
                children: [
                  IconButton( // Botón de pausa/play.
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying; // Invierte el estado de reproducción.
                        if (isPlaying) {
                          _iniciarCronometro(); // Inicia el cronómetro.
                        } else {
                          _detenerCronometro(); // Detiene el cronómetro.
                        }
                      });
                    },
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow, // Icono de pausa o play.
                      color: Colors.white, // Color de icono blanco.
                      size: 30, // Tamaño de icono 30.
                    ),
                  ),
                  IconButton( // Botón de stop.
                    onPressed: () {
                      setState(() {
                        isPlaying = false; // Detiene la reproducción.
                        tiempoTranscurrido = Duration.zero; // Reinicia el tiempo transcurrido.
                        _detenerCronometro(); // Detiene el cronómetro.
                      });
                    },
                    icon: const Icon(Icons.stop, color: Colors.white, size: 30), // Icono de stop.
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para formatear la duración a HH:MM:SS.
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0'); // Añade un 0 delante si es necesario.
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60)); // Minutos.
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60)); // Segundos.
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds"; // Formato HH:MM:SS.
  }

  // Función para iniciar el cronómetro.
  void _iniciarCronometro() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) { // Se ejecuta cada segundo.
      setState(() {
        tiempoTranscurrido = tiempoTranscurrido + const Duration(seconds: 1); // Incrementa el tiempo transcurrido.
      });
    });
  }

  // Función para detener el cronómetro.
  void _detenerCronometro() {
    _timer?.cancel(); // Cancela el temporizador si existe.
  }
}
