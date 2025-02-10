import 'package:flutter/material.dart';

// Widget que representa la pantalla de ejecuciones de un ejercicio.
class EjecucionesScreen extends StatelessWidget {
  const EjecucionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Color de fondo negro para la pantalla.
      body: SafeArea( // SafeArea para evitar que el contenido se superponga a la barra de estado u otros elementos del sistema.
        child: Column( // Columna principal que organiza los elementos verticalmente.
          crossAxisAlignment: CrossAxisAlignment.center, // Alinea los elementos horizontalmente al centro.
          children: [
            // Contenedor para la cabecera con imagen y título.
            Container(
              color: Colors.green, // Color de fondo verde para la cabecera.
              padding: const EdgeInsets.all(16.0), // Padding interno para la cabecera.
              child: const Row( // Fila para organizar la imagen y el título horizontalmente.
                children: [
                  /* Image.network(
                    'https://via.placeholder.com/150', // Replace with your image URL
                    width: 80,
                    height: 80,
                  ),*/ // arreflar error de la imagen - Comentado porque la URL es un placeholder y puede causar errores.
                  SizedBox(width: 16), // Espacio horizontal entre la imagen y el título.
                  Text(
                    'crunch básico', // Título del ejercicio.
                    style: TextStyle(
                      color: Colors.white, // Color de texto blanco.
                      fontSize: 20, // Tamaño de fuente 20.
                      fontWeight: FontWeight.bold, // Texto en negrita.
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16), // Espacio vertical entre la cabecera y las instrucciones.
            // Sección de instrucciones.
            Expanded( // El widget Expanded permite que este contenedor ocupe el espacio disponible restante.
              child: Container(
                padding: const EdgeInsets.all(16.0), // Padding interno para las instrucciones.
                decoration: BoxDecoration(
                  color: Colors.grey[900], // Color de fondo gris oscuro para las instrucciones.
                  borderRadius: const BorderRadius.vertical( // Bordes redondeados solo en la parte superior.
                    top: Radius.circular(20.0),
                  ),
                ),
                child: const Column( // Columna para organizar el texto de las instrucciones verticalmente.
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda.
                  children:  [
                    Text(
                      'Posición Inicial:', // Título de la sección de posición inicial.
                      style: TextStyle(
                        color: Colors.white, // Color de texto blanco.
                        fontSize: 18, // Tamaño de fuente 18.
                        fontWeight: FontWeight.bold, // Texto en negrita.
                      ),
                    ),
                    SizedBox(height: 8), // Espacio vertical entre el título y el texto de la posición inicial.
                    Text(
                      'Acuéstate sobre una superficie plana, como una colchoneta.\n\n'
                      'Flexiona las rodillas y coloca los pies planos en el suelo, separados al ancho de las caderas.\n\n'
                      'Coloca las manos detrás de la cabeza o cruzadas sobre el pecho. '
                      'Si las colocas detrás de la cabeza, asegúrate de no usar las manos para jalar el cuello.', // Instrucciones de la posición inicial.
                      style: TextStyle(
                        color: Colors.white, // Color de texto blanco.
                        fontSize: 16, // Tamaño de fuente 16.
                        height: 1.5, // Altura de línea 1.5.
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Botón de reproducción.
            Container(
              padding: const EdgeInsets.all(16.0), // Padding interno para el botón.
              child: ElevatedButton(
                onPressed: () {}, // Acción al presionar el botón (actualmente vacía).
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700], // Color de fondo gris para el botón.
                  shape: const CircleBorder(), // Forma circular para el botón.
                  padding: const EdgeInsets.all(20), // Padding interno para el botón.
                ),
                child: const Icon(
                  Icons.play_arrow, // Icono de reproducción.
                  color: Colors.white, // Color de icono blanco.
                  size: 40, // Tamaño de icono 40.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}