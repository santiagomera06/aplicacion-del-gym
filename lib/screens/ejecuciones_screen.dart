import 'package:flutter/material.dart';

// Pantalla que muestra las ejecuciones de un ejercicio.
class PantallaEjecuciones extends StatelessWidget {
  const PantallaEjecuciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro para la pantalla.
      body: SafeArea(
        // Asegura que el contenido no se superponga con áreas como la barra de estado.
        child: Column(
          // Organiza los widgets de forma vertical.
          crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos horizontalmente.
          children: [
            // Cabecera con imagen y título.
            Container(
              color: Colors.green, // Fondo verde para la cabecera.
              padding: const EdgeInsets.all(16.0), // Espacio interno de 16 píxeles.
              child: const Row(
                // Organiza los widgets de forma horizontal.
                children: [
                  // Imagen (comentada porque la URL es un marcador de posición y puede causar errores).
                  /*
                  Image.network(
                    'https://via.placeholder.com/150', // Reemplaza con la URL de tu imagen.
                    width: 80,
                    height: 80,
                  ),
                  */
                  SizedBox(width: 16), // Espacio horizontal entre la imagen y el texto.
                  Text(
                    'Crunch básico', // Título del ejercicio.
                    style: TextStyle(
                      color: Colors.white, // Texto en color blanco.
                      fontSize: 20, // Tamaño de fuente 20.
                      fontWeight: FontWeight.bold, // Texto en negrita.
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16), // Espacio vertical entre la cabecera y las instrucciones.
            // Sección de instrucciones.
            Expanded(
              // Expande este widget para ocupar el espacio disponible.
              child: Container(
                padding: const EdgeInsets.all(16.0), // Espacio interno de 16 píxeles.
                decoration: BoxDecoration(
                  color: Colors.grey[900], // Fondo gris oscuro para las instrucciones.
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20.0), // Bordes redondeados en la parte superior.
                  ),
                ),
                child: const Column(
                  // Organiza los widgets de forma vertical.
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda.
                  children: [
                    Text(
                      'Posición Inicial:', // Encabezado de la sección.
                      style: TextStyle(
                        color: Colors.white, // Texto en color blanco.
                        fontSize: 18, // Tamaño de fuente 18.
                        fontWeight: FontWeight.bold, // Texto en negrita.
                      ),
                    ),
                    SizedBox(height: 8), // Espacio vertical entre el título y el contenido.
                    Text(
                      'Acuéstate sobre una superficie plana, como una colchoneta.\n\n'
                      'Flexiona las rodillas y coloca los pies planos en el suelo, separados al ancho de las caderas.\n\n'
                      'Coloca las manos detrás de la cabeza o cruzadas sobre el pecho. '
                      'Si las colocas detrás de la cabeza, asegúrate de no usar las manos para jalar el cuello.', // Instrucciones detalladas.
                      style: TextStyle(
                        color: Colors.white, // Texto en color blanco.
                        fontSize: 16, // Tamaño de fuente 16.
                        height: 1.5, // Altura de línea para mejorar la legibilidad.
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Botón de reproducción.
            Container(
              padding: const EdgeInsets.all(16.0), // Espacio interno alrededor del botón.
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar el botón (actualmente vacío).
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700], // Fondo gris para el botón.
                  shape: const CircleBorder(), // Forma circular del botón.
                  padding: const EdgeInsets.all(20), // Espacio interno del botón.
                ),
                child: const Icon(
                  Icons.play_arrow, // Icono de "play" para indicar reproducción.
                  color: Colors.white, // Icono en color blanco.
                  size: 40, // Tamaño del icono.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
