import 'package:flutter/material.dart';

// Define un widget con estado (StatefulWidget) llamado numero_repe
// ignore: camel_case_types, use_key_in_widget_constructors
class numero_repe extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _EjecucionesScreenState createState() => _EjecucionesScreenState();
}

// Define el estado (State) para el widget numero_repe
class _EjecucionesScreenState extends State<numero_repe> {
  // Variable para controlar el estado de reproducción (play/pause)
  bool isPlaying = false;
  // Variables para almacenar los valores numéricos
  int numeroSerie = 4;
  int numeroRepeticiones = 12;
  int tiempoRepeticion = 60;
  double carga = 0.0;

  @override
  Widget build(BuildContext context) {
    // Devuelve un Scaffold (estructura básica de una pantalla)
    return Scaffold(
      backgroundColor: Colors.black, // Establece el color de fondo como negro
      body: SafeArea(
        // Asegura que el contenido no se superponga a la barra de estado del dispositivo
        child: Column(
          // Usa una columna para organizar los widgets verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Estira los widgets horizontalmente
          children: [
            // Barra de título verde con imagen
            Container(
              color: Colors.green, // Color de fondo verde
              padding: const EdgeInsets.all(16.0), // Padding interno
              child: const Row(
                // Usa una fila para organizar los elementos horizontalmente
                children: [
                  /*Image.asset(
                    'assets/plancha_ejercicio.png', // Ruta de la imagen (debe estar en assets y declarada en pubspec.yaml)
                    width: 80, // Ancho de la imagen
                    height: 80, // Alto de la imagen
                  ),*/
                  SizedBox(
                      width:
                          16), // Espacio horizontal entre la imagen y el texto
                  Text(
                    'Plancha', // Título del ejercicio
                    style: TextStyle(
                      color: Colors.white, // Color del texto blanco
                      fontSize: 20, // Tamaño de la fuente 20
                      fontWeight: FontWeight.bold, // Texto en negrita
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16), // Espacio vertical

            // Contenedores para la información del ejercicio
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Padding horizontal
              child: Column(
                // Columna para organizar los contenedores verticalmente
                children: [
                  _buildInfoRow('Rep/Carga', 'Tipo de Serie',
                      'Tipo de Serie'), // Fila de información
                  const SizedBox(height: 16), // Espacio vertical
                  _buildNumberControl('Número de serie', numeroSerie, (value) {
                    // Control numérico para número de serie
                    setState(() {
                      // Actualiza el estado del widget
                      numeroSerie = value; // Asigna el nuevo valor
                    });
                  }),
                  const SizedBox(height: 16), // Espacio vertical
                  _buildNumberControl(
                      'Número de repeticiones', numeroRepeticiones, (value) {
                    // Control numérico para repeticiones
                    setState(() {
                      numeroRepeticiones = value;
                    });
                  }),
                  const SizedBox(height: 16), // Espacio vertical
                  _buildNumberControl(
                      'Tiempo de repetición (segundos)', tiempoRepeticion,
                      (value) {
                    // Control numérico para tiempo
                    setState(() {
                      tiempoRepeticion = value;
                    });
                  }),
                  const SizedBox(height: 16), // Espacio vertical
                  _buildNumberControl('Carga', carga, (value) {
                    // Control numérico para carga (permite decimales)
                    setState(() {
                      carga = value;
                    });
                  }, isDouble: true), // Para carga, permite decimales
                  const SizedBox(height: 16), // Espacio vertical
                  const Row(
                    // Fila para el asterisco y el texto "carga"
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Distribuye los elementos en el espacio disponible
                  ),
                ],
              ),
            ),

            const Spacer(), // Ocupa el espacio restante para empujar la barra de control hacia abajo

            // Barra de control de reproducción
            Container(
              color: const Color.fromARGB(
                  255, 43, 159, 17), // Color de fondo verde oscuro
              padding: const EdgeInsets.all(8.0), // Padding interno
              child: Row(
                // Fila para organizar los elementos horizontalmente
                mainAxisAlignment: MainAxisAlignment
                    .spaceAround, // Distribuye los elementos en el espacio disponible
                children: [
                  IconButton(
                    // Botón para reproducir
                    onPressed: () {
                      setState(() {
                        isPlaying = true; // Cambia el estado a "reproduciendo"
                        // Aquí va la lógica para iniciar la reproducción
                      });
                    },
                    icon: const Icon(Icons.play_arrow,
                        color: Colors.white, size: 30), // Icono de "play"
                  ),
                  IconButton(
                    // Botón para pausar
                    onPressed: () {
                      setState(() {
                        isPlaying = false; // Cambia el estado a "pausado"
                        // Aquí va la lógica para pausar la reproducción
                      });
                    },
                    icon: const Icon(Icons.pause,
                        color: Colors.white, size: 30), // Icono de "pause"
                  ),
                  IconButton(
                    // Botón para detener
                    onPressed: () {
                      setState(() {
                        isPlaying = false; // Cambia el estado a "detenido"
                        // Aquí va la lógica para detener la reproducción
                      });
                    },
                    icon: const Icon(Icons.stop,
                        color: Colors.white, size: 30), // Icono de "stop"
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir filas de información (sin controles numéricos)
  Widget _buildInfoRow(String label1, String text1, String text2) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding interno
      decoration: BoxDecoration(
        color: Colors.grey[900], // Color de fondo gris oscuro
        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
      ),
      child: Row(
        // Fila para organizar los elementos horizontalmente
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Distribuye los elementos en el espacio disponible
        children: [
          Text(label1, style: const TextStyle(color: Colors.white)), // Texto 1
          Text(text1, style: const TextStyle(color: Colors.white)), // Texto 2
          Text(text2, style: const TextStyle(color: Colors.white)), // Texto 3
        ],
      ),
    );
  }

  // Widget para construir controles numéricos (para series, repeticiones, etc.)
  Widget _buildNumberControl(
      String label, dynamic value, Function(dynamic) onChanged,
      {bool isDouble = false}) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding interno
      decoration: BoxDecoration(
        color: Colors.grey[900], // Color de fondo gris oscuro
        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
      ),
      child: Row(
        // Fila para organizar los elementos horizontalmente
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Distribuye los elementos en el espacio disponible
        children: [
          Text(label, style: const TextStyle(color: Colors.white)), // Etiqueta
          Row(
            // Fila para los botones y el valor
            children: [
              IconButton(
                // Botón para decrementar
                icon: const Icon(Icons.remove, color: Colors.white),
                onPressed: () {
                  onChanged(isDouble
                      ? value - 0.5
                      : value - 1); // Decrementa el valor (0.5 si es double)
                },
              ),
              Text(value.toString(),
                  style: const TextStyle(color: Colors.white)), // Valor actual
              IconButton(
                // Botón para incrementar
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  onChanged(isDouble
                      ? value + 0.5
                      : value + 1); // Incrementa el valor (0.5 si es double)
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
