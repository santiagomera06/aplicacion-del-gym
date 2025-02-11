// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

// Widget con estado que representa la pantalla de número de repeticiones.
class NumeroRepeticiones extends StatefulWidget {
  const NumeroRepeticiones({super.key});

  @override
  _NumeroRepeticionesState createState() => _NumeroRepeticionesState();
}

// Estado asociado al widget NumeroRepeticiones.
class _NumeroRepeticionesState extends State<NumeroRepeticiones> {
  // Variable para controlar el estado de reproducción (reproduciendo/pausado).
  bool reproduciendo = false;
  // Variables para almacenar los valores numéricos de series, repeticiones, tiempo y carga.
  int numeroSeries = 4;
  int numeroRepeticiones = 12;
  int tiempoRepeticion = 60;
  double carga = 0.0;

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz de la pantalla.
    return Scaffold(
      backgroundColor: Colors.black, // Establece el fondo a negro.
      body: SafeArea(
        // Asegura que el contenido esté dentro de los límites seguros de la pantalla.
        child: Column(
          // Organiza los widgets de forma vertical.
          crossAxisAlignment: CrossAxisAlignment.stretch, // Extiende los widgets horizontalmente.
          children: [
            // Barra de título con fondo verde y texto "Plancha".
            Container(
              color: Colors.green, // Fondo verde.
              padding: const EdgeInsets.all(16.0), // Espacio interno.
              child: const Row(
                // Organiza los elementos horizontalmente.
                children: [
                  // Aquí se puede añadir una imagen si es necesario.
                   SizedBox(width: 16), // Espacio horizontal.
                   Text(
                    'Plancha', // Título del ejercicio.
                    style: TextStyle(
                      color: Colors.white, // Texto de color blanco.
                      fontSize: 20, // Tamaño de fuente.
                      fontWeight: FontWeight.bold, // Texto en negrita.
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16), // Espacio vertical.
            // Contenedor para la información del ejercicio.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espacio horizontal.
              child: Column(
                // Organiza los elementos verticalmente.
                children: [
                  _crearFilaInfo('Rep/Carga', 'Tipo de Serie', 'Tipo de Serie'), // Fila de información.
                  const SizedBox(height: 16), // Espacio vertical.
                  _crearControlNumerico('Número de series', numeroSeries, (valor) {
                    // Control para ajustar el número de series.
                    setState(() {
                      numeroSeries = valor; // Actualiza el valor.
                    });
                  }),
                  const SizedBox(height: 16),
                  _crearControlNumerico('Número de repeticiones', numeroRepeticiones, (valor) {
                    // Control para ajustar el número de repeticiones.
                    setState(() {
                      numeroRepeticiones = valor;
                    });
                  }),
                  const SizedBox(height: 16),
                  _crearControlNumerico('Tiempo de repetición (segundos)', tiempoRepeticion, (valor) {
                    // Control para ajustar el tiempo de repetición.
                    setState(() {
                      tiempoRepeticion = valor;
                    });
                  }),
                  const SizedBox(height: 16),
                  _crearControlNumerico('Carga', carga, (valor) {
                    // Control para ajustar la carga (permite decimales).
                    setState(() {
                      carga = valor;
                    });
                  }, esDecimal: true), // Indica que el valor es decimal.
                  const SizedBox(height: 16),
                  const Row(
                    // Fila vacía para posible información adicional.
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
              ),
            ),
            const Spacer(), // Ocupa el espacio disponible para empujar elementos hacia abajo.
            // Barra de control de reproducción.
            Container(
              color: const Color.fromARGB(255, 43, 159, 17), // Fondo verde oscuro.
              padding: const EdgeInsets.all(8.0), // Espacio interno.
              child: Row(
                // Organiza los botones horizontalmente.
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribuye los botones equitativamente.
                children: [
                  IconButton(
                    // Botón de reproducir.
                    onPressed: () {
                      setState(() {
                        reproduciendo = true; // Cambia el estado a reproduciendo.
                        // Aquí va la lógica para iniciar la reproducción.
                      });
                    },
                    icon: const Icon(Icons.play_arrow, color: Colors.white, size: 30), // Icono de reproducir.
                  ),
                  IconButton(
                    // Botón de pausar.
                    onPressed: () {
                      setState(() {
                        reproduciendo = false; // Cambia el estado a pausado.
                        // Aquí va la lógica para pausar la reproducción.
                      });
                    },
                    icon: const Icon(Icons.pause, color: Colors.white, size: 30), // Icono de pausar.
                  ),
                  IconButton(
                    // Botón de detener.
                    onPressed: () {
                      setState(() {
                        reproduciendo = false; // Cambia el estado a detenido.
                        // Aquí va la lógica para detener la reproducción.
                      });
                    },
                    icon: const Icon(Icons.stop, color: Colors.white, size: 30), // Icono de detener.
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para crear una fila de información sin controles numéricos.
  Widget _crearFilaInfo(String etiqueta1, String texto1, String texto2) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Espacio interno.
      decoration: BoxDecoration(
        color: Colors.grey[900], // Fondo gris oscuro.
        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados.
      ),
      child: Row(
        // Organiza los elementos horizontalmente.
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los elementos equitativamente.
        children: [
          Text(etiqueta1, style: const TextStyle(color: Colors.white)), // Primer texto.
          Text(texto1, style: const TextStyle(color: Colors.white)),     // Segundo texto.
          Text(texto2, style: const TextStyle(color: Colors.white)),     // Tercer texto.
        ],
      ),
    );
  }

  // Método para crear un control numérico con botones de incrementar y decrementar.
  Widget _crearControlNumerico(String etiqueta, dynamic valor, Function(dynamic) onChanged, {bool esDecimal = false}) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Espacio interno.
      decoration: BoxDecoration(
        color: Colors.grey[900], // Fondo gris oscuro.
        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados.
      ),
      child: Row(
        // Organiza los elementos horizontalmente.
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los elementos equitativamente.
        children: [
          Text(etiqueta, style: const TextStyle(color: Colors.white)), // Etiqueta del control.
          Row(
            // Fila interna para los botones y el valor.
            children: [
              IconButton(
                // Botón para disminuir el valor.
                icon: const Icon(Icons.remove, color: Colors.white),
                onPressed: () {
                  onChanged(esDecimal ? valor - 0.5 : valor - 1); // Decrementa el valor según sea decimal o entero.
                },
              ),
              Text(valor.toString(), style: const TextStyle(color: Colors.white)), // Muestra el valor actual.
              IconButton(
                // Botón para aumentar el valor.
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  onChanged(esDecimal ? valor + 0.5 : valor + 1); // Incrementa el valor.
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
