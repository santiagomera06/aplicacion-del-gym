import 'package:flutter/material.dart';
import '../app_styles.dart';

// Widget que representa la pantalla de ejercicios para principiantes.
class EjerciciosPrincipianteScreen extends StatefulWidget {
  const EjerciciosPrincipianteScreen({super.key});

  @override
  State<EjerciciosPrincipianteScreen> createState() =>
      _EjerciciosPrincipianteScreenState();
}

class _EjerciciosPrincipianteScreenState
    extends State<EjerciciosPrincipianteScreen> {
  int _selectedIndex =
      0; // Índice seleccionado en la barra de navegación inferior.

  // Función que se llama al tocar un elemento de la barra de navegación.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice seleccionado.
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
      backgroundColor: Colors.black, // Color de fondo negro.
      body: Column(
        // Columna principal que contiene el encabezado y los botones.
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // Los elementos se estiran horizontalmente.
        children: [
          // Encabezado verde.
          Container(
            color: Colors.green, // Color de fondo verde.
            padding: const EdgeInsets.all(16.0), // Padding interno.
            child: const Column(
              // Columna para el título y el subtítulo.
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Texto alineado a la izquierda.
              children: [
                Text(
                  'principiante', // Título del encabezado.
                  style: AppStyles.headerTitleTextStyle, // Estilo del título.
                ),
                SizedBox(
                    height: 8), // Espacio vertical entre título y subtítulo.
                Text(
                  'los ejercicios de musculación para principiantes deben prepararse específicamente para ese nivel', // Subtítulo del encabezado.
                  style: AppStyles
                      .headerSubtitleTextStyle, // Estilo del subtítulo.
                ),
              ],
            ),
          ),
          const SizedBox(
              height: 10), // Espacio vertical después del encabezado.
          // Botones de opciones.
          const Expanded(
            // El widget Expanded permite que los botones ocupen el espacio restante.
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 56.0), // Padding horizontal para los botones.
              child: Column(
                // Columna para los botones.
                mainAxisAlignment: MainAxisAlignment
                    .center, // Botones centrados verticalmente.
                children: [
                  BotonOpcion(
                      texto:
                          'Enfoque piernas'), // Botón de opción para enfoque en piernas.
                  SizedBox(height: 56), // Espacio vertical entre botones.
                  BotonOpcion(
                      texto:
                          'Enfoque glúteos'), // Botón de opción para enfoque en glúteos.
                  SizedBox(height: 56), // Espacio vertical entre botones.
                  BotonOpcion(
                      texto:
                          'piernas gruesas'), // Botón de opción para piernas gruesas.
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
            // Elemento de navegación para Desafíos.
            icon: Icon(Icons.school),
            label: 'Desafíos',
          ),
          BottomNavigationBarItem(
            // Elemento de navegación para Clasificación.
            icon: Icon(Icons.emoji_events),
            label: 'Clasificación',
          ),
          BottomNavigationBarItem(
            // Elemento de navegación para Perfil.
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex, // Índice del elemento seleccionado.
        selectedItemColor:
            Colors.white, // Color de los iconos/textos seleccionados.
        unselectedItemColor:
            Colors.white70, // Color de los iconos/textos no seleccionados.
        backgroundColor:
            Colors.green, // Color de fondo de la barra de navegación.
        onTap: _onItemTapped, // Función que se llama al tocar un elemento.
        type: BottomNavigationBarType.fixed, // Muestra todos los labels.
        iconSize: 28, // Tamaño de los iconos.
      ),
    );
  }
}

// Widget para crear botones de opción reutilizables.
class BotonOpcion extends StatelessWidget {
  final String texto; // Texto del botón.

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
            vertical: 30.0, horizontal: 90.0), // Padding interno del botón.
      ),
      onPressed: () {
        // Acción al presionar el botón.
        // ignore: avoid_print
        print(
            'Seleccionaste: $texto'); // Imprime el texto del botón en la consola.
      },
      child: Text(
        texto, // Texto del botón.
        style: AppStyles.buttonTextStyle, // Estilo del texto del botón.
      ),
    );
  }
}
