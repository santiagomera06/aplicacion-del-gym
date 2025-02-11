import 'package:flutter/material.dart';
import '../app_styles.dart'; // Importa estilos personalizados desde un archivo local.

// Widget que representa la pantalla de ejercicios para principiantes.
class PantallaEjerciciosPrincipiante extends StatefulWidget {
  const PantallaEjerciciosPrincipiante({super.key});

  @override
  State<PantallaEjerciciosPrincipiante> createState() =>
      _PantallaEjerciciosPrincipianteState();
}

// Estado asociado a la pantalla de ejercicios para principiantes.
class _PantallaEjerciciosPrincipianteState
    extends State<PantallaEjerciciosPrincipiante> {
  int _indiceSeleccionado =
      0; // Índice seleccionado en la barra de navegación inferior.

  // Función que se llama al tocar un elemento de la barra de navegación.
  void _alTocarElemento(int index) {
    setState(() {
      _indiceSeleccionado = index; // Actualiza el índice seleccionado.
      // Navegar a la pantalla correspondiente según el índice.
      switch (index) {
        case 0: // Desafíos
          // Navigator.push(...); // Navegar a la pantalla de desafíos.
          break;
        case 1: // Clasificación
          // Navigator.push(...); // Navegar a la pantalla de clasificación.
          break;
        case 2: // Perfil
          // Navigator.push(...); // Navegar a la pantalla de perfil.
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Establece el fondo negro.
      body: Column(
        // Columna principal que contiene el encabezado y los botones.
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // Los elementos se estiran horizontalmente.
        children: [
          // Encabezado verde.
          Container(
            color: Colors.green, // Fondo verde para el encabezado.
            padding: const EdgeInsets.all(16.0), // Espacio interno.
            child: const Column(
              // Columna para el título y el subtítulo.
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinea el texto a la izquierda.
              children: [
                Text(
                  'Principiante', // Título principal.
                  style: AppStyles
                      .headerTitleTextStyle, // Estilo definido en app_styles.dart.
                ),
                SizedBox(
                    height: 8), // Espacio vertical entre título y subtítulo.
                Text(
                  'Los ejercicios de musculación para principiantes deben prepararse específicamente para ese nivel.',
                  // Subtítulo.
                  style: AppStyles
                      .headerSubtitleTextStyle, // Estilo definido en app_styles.dart.
                ),
              ],
            ),
          ),
          const SizedBox(
              height: 10), // Espacio vertical después del encabezado.
          // Botones de opciones.
          const Expanded(
            // Los botones ocupan el espacio restante.
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 56.0), // Margen horizontal.
              child: Column(
                // Columna que contiene los botones.
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centra los botones verticalmente.
                children: [
                  BotonOpcion(
                      texto:
                          'Enfoque piernas'), // Botón para enfoque en piernas.
                  SizedBox(height: 56), // Espacio entre botones.
                  BotonOpcion(
                      texto:
                          'Enfoque glúteos'), // Botón para enfoque en glúteos.
                  SizedBox(height: 56), // Espacio entre botones.
                  BotonOpcion(
                      texto:
                          'Piernas gruesas'), // Botón para rutina de piernas gruesas.
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Barra de navegación inferior.
        items: const [
          BottomNavigationBarItem(
            // Opción de Desafíos.
            icon: Icon(Icons.school),
            label: 'Desafíos',
          ),
          BottomNavigationBarItem(
            // Opción de Clasificación.
            icon: Icon(Icons.emoji_events),
            label: 'Clasificación',
          ),
          BottomNavigationBarItem(
            // Opción de Perfil.
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _indiceSeleccionado, // Índice del elemento seleccionado.
        selectedItemColor:
            Colors.white, // Color de icono y texto cuando está seleccionado.
        unselectedItemColor:
            Colors.white70, // Color de icono y texto cuando no está seleccionado.
        backgroundColor:
            Colors.green, // Color de fondo de la barra de navegación.
        onTap: _alTocarElemento, // Llama a la función cuando se toca un ítem.
        type: BottomNavigationBarType.fixed, // Muestra todas las etiquetas.
        iconSize: 28, // Tamaño de los iconos.
      ),
    );
  }
}

// Widget personalizado para los botones de opción.
class BotonOpcion extends StatelessWidget {
  final String texto; // Texto que aparece en el botón.

  const BotonOpcion({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Color de fondo del botón.
        shape: RoundedRectangleBorder(
          // Forma del botón con bordes redondeados.
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 30.0, horizontal: 90.0), // Espacio interno del botón.
      ),
      onPressed: () {
        // Acción al presionar el botón.
        // Puedes agregar la navegación a la pantalla correspondiente aquí.
        print('Seleccionaste: $texto'); // Imprime en consola el texto seleccionado.
      },
      child: Text(
        texto, // Muestra el texto en el botón.
        style: AppStyles.buttonTextStyle, // Estilo de texto definido en app_styles.dart.
      ),
    );
  }
}
