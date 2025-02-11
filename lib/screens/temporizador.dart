// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';

// Widget con estado que representa un temporizador.
class Temporizador extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _EstadoTemporizador createState() => _EstadoTemporizador();
}

// Estado asociado al widget Temporizador.
class _EstadoTemporizador extends State<Temporizador> {
  bool enMarcha = false; // Controla si el temporizador está en funcionamiento.
  Duration tiempoTranscurrido = Duration.zero; // Almacena el tiempo transcurrido.
  Timer? _temporizador; // Objeto Timer que se actualizará cada segundo.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Establece el fondo de la pantalla a negro.
      body: SafeArea(
        // Asegura que el contenido esté dentro de las áreas seguras del dispositivo.
        child: Column(
          // Organiza los widgets de forma vertical.
          crossAxisAlignment: CrossAxisAlignment.stretch, // Estira los widgets horizontalmente.
          children: [
            // Barra de título verde con una posible imagen.
            Container(
              color: Colors.green, // Fondo verde para la barra de título.
              padding: const EdgeInsets.all(16.0), // Espacio interno uniforme.
              child:const Row(
                // Organiza los elementos horizontalmente.
                children: [
                  // Aquí se podría agregar una imagen si es necesario.
                  SizedBox(width: 16), // Espacio horizontal entre la imagen y el texto.
                  Text(
                    'Plancha', // Título del ejercicio o pantalla.
                    style: TextStyle(
                      color: Colors.white, // Texto en color blanco.
                      fontSize: 20, // Tamaño del texto.
                      fontWeight: FontWeight.bold, // Texto en negrita.
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16), // Espacio vertical entre elementos.

            // Contenedor que indica que el temporizador está en ejecución.
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0), // Margen horizontal.
              padding: const EdgeInsets.all(8.0), // Espacio interno.
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.5), // Fondo verde semitransparente.
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados.
              ),
              child: const Center(
                // Centra el texto dentro del contenedor.
                child: Text(
                  'En ejecución', // Texto que indica el estado.
                  style: TextStyle(color: Colors.white), // Texto en color blanco.
                ),
              ),
            ),

            const SizedBox(height: 16), // Espacio vertical.

            // Contenedor que muestra el cronómetro.
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0), // Margen horizontal.
              padding: const EdgeInsets.all(16.0), // Espacio interno.
              decoration: BoxDecoration(
                color: Colors.grey[900], // Fondo gris oscuro.
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados.
              ),
              child: Center(
                // Centra el contenido.
                child: Text(
                  _formatearDuracion(tiempoTranscurrido), // Muestra el tiempo transcurrido formateado.
                  style: const TextStyle(
                    color: Colors.white, // Texto en color blanco.
                    fontSize: 40, // Tamaño grande para resaltar el tiempo.
                    fontWeight: FontWeight.bold, // Texto en negrita.
                  ),
                ),
              ),
            ),

            const Spacer(), // Ocupa el espacio restante para empujar los botones hacia abajo.

            // Barra de control con botones para el temporizador.
            Container(
              color: const Color.fromARGB(255, 159, 17, 17), // Fondo rojo para la barra de control.
              padding: const EdgeInsets.all(8.0), // Espacio interno.
              child: Row(
                // Organiza los botones horizontalmente.
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribuye los botones equitativamente.
                children: [
                  IconButton(
                    // Botón para iniciar o pausar el temporizador.
                    onPressed: () {
                      setState(() {
                        enMarcha = !enMarcha; // Cambia el estado entre en marcha y pausado.
                        if (enMarcha) {
                          _iniciarCronometro(); // Si está en marcha, inicia el cronómetro.
                        } else {
                          _detenerCronometro(); // Si está pausado, detiene el cronómetro.
                        }
                      });
                    },
                    icon: Icon(
                      enMarcha ? Icons.pause : Icons.play_arrow, // Icono cambia según el estado.
                      color: Colors.white, // Color del icono.
                      size: 30, // Tamaño del icono.
                    ),
                  ),
                  IconButton(
                    // Botón para detener y reiniciar el temporizador.
                    onPressed: () {
                      setState(() {
                        enMarcha = false; // Cambia el estado a detenido.
                        tiempoTranscurrido = Duration.zero; // Reinicia el tiempo transcurrido.
                        _detenerCronometro(); // Detiene el cronómetro si está activo.
                      });
                    },
                    icon: const Icon(
                      Icons.stop, // Icono de detener.
                      color: Colors.white, // Color del icono.
                      size: 30, // Tamaño del icono.
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función que formatea la duración en un formato legible (HH:MM:SS).
  String _formatearDuracion(Duration duracion) {
    String dosDigitos(int n) => n.toString().padLeft(2, '0'); // Asegura que el número tenga al menos dos dígitos.
    String horas = dosDigitos(duracion.inHours); // Obtiene las horas.
    String minutos = dosDigitos(duracion.inMinutes.remainder(60)); // Obtiene los minutos restantes.
    String segundos = dosDigitos(duracion.inSeconds.remainder(60)); // Obtiene los segundos restantes.
    return "$horas:$minutos:$segundos"; // Retorna el tiempo formateado.
  }

  // Función para iniciar el cronómetro.
  void _iniciarCronometro() {
    _temporizador = Timer.periodic(
      const Duration(seconds: 1), // Intervalo de un segundo.
      (timer) {
        setState(() {
          tiempoTranscurrido += const Duration(seconds: 1); // Incrementa el tiempo transcurrido en un segundo.
        });
      },
    );
  }

  // Función para detener el cronómetro.
  void _detenerCronometro() {
    _temporizador?.cancel(); // Cancela el temporizador si está activo.
  }
}
