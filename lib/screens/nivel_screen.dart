 import 'package:flutter/material.dart';
import '../app_styles.dart';

// Este widget representa la pantalla principal para mostrar los niveles.
class NivelScreen extends StatefulWidget {
  const NivelScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NivelScreenState createState() => _NivelScreenState();
}

class _NivelScreenState extends State<NivelScreen> {
  // Índice seleccionado en la barra de navegación inferior. Inicializado en 1.
  int _selectedIndex = 1;

  // Función que se llama al tocar un elemento de la barra de navegación.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice seleccionado.
      // Aquí podrías agregar la lógica para navegar a otras pantallas según el índice.
      // Por ejemplo:
      // if (index == 0) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => DesafiosScreen()));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Color de fondo negro.
      appBar: AppBar(
        backgroundColor: Colors.black, // Color de fondo de la barra de app negro.
        elevation: 0, // Elimina la sombra debajo de la barra de app.
        leading: const Icon(Icons.person, color: Colors.green), // Icono de persona a la izquierda.
        title: const Row(
          children: [
            Text('user', style: AppStyles.userTextStyle), // Texto 'user' con estilo definido en AppStyles.
            Spacer(), // Espacio para empujar el icono de menú a la derecha.
            Icon(Icons.menu, color: Colors.green), // Icono de menú a la derecha.
          ],
        ),
      ),
      body: const SingleChildScrollView( // Permite hacer scroll si el contenido es más largo que la pantalla.
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30), // Espacio alrededor del contenido.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Alinea los elementos al centro horizontalmente.
            children: [
              Text('Nivel', style: AppStyles.nivelTextStyle), // Texto 'Nivel' con estilo definido.
              SizedBox(height: 50), // Espacio vertical.
              NivelCard(nivel: 'Principiante', experiencia: 'Menos de 6 meses\nde experiencia'), // Tarjeta de nivel Principiante.
              SizedBox(height: 50), // Espacio vertical.
              NivelCard(nivel: 'Intermedio', experiencia: 'Más de 6 meses y\nmenos de 2 años'), // Tarjeta de nivel Intermedio.
              SizedBox(height: 50), // Espacio vertical.
              NivelCard(nivel: 'Avanzado', experiencia: 'Más de 2 años'), // Tarjeta de nivel Avanzado.
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( // Barra de navegación inferior.
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Desafíos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Clasificación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex, // Índice del elemento seleccionado.
        selectedItemColor: Colors.white, // Color de los iconos/textos seleccionados.
        unselectedItemColor: Colors.white70, // Color de los iconos/textos no seleccionados.
        backgroundColor: Colors.green, // Color de fondo de la barra de navegación.
        onTap: _onItemTapped, // Función que se llama al tocar un elemento.
        type: BottomNavigationBarType.fixed, // Muestra todos los labels.
        iconSize: 28, // Tamaño de los iconos.
      ),
    );
  }
}

// Widget para mostrar la tarjeta de nivel.
class NivelCard extends StatelessWidget {
  final String nivel; // Nivel (Principiante, Intermedio, Avanzado).
  final String experiencia; // Descripción de la experiencia.

  const NivelCard({super.key, 
    required this.nivel,
    required this.experiencia,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Contenedor izquierdo (nivel).
        Expanded(
          flex: 2, // Ocupa 2/5 del espacio.
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Espacio interno.
            decoration: const BoxDecoration(
              color: Colors.black87, // Color de fondo negro semi-transparente.
              borderRadius: BorderRadius.only( // Bordes redondeados solo a la izquierda.
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Text(
              nivel, // Texto del nivel.
              style: AppStyles.nivelCardTitleTextStyle, // Estilo del texto del nivel.
              textAlign: TextAlign.center, // Alineación del texto al centro.
            ),
          ),
        ),
        // Contenedor derecho (experiencia).
        Expanded(
          flex: 3, // Ocupa 3/5 del espacio.
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Espacio interno.
            decoration: const BoxDecoration(
              color: Colors.green, // Color de fondo verde.
              borderRadius: BorderRadius.only( // Bordes redondeados solo a la derecha.
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Alineación de los elementos al centro.
              children: [
                Text(
                  'experiencia', // Texto "experiencia".
                  style: AppStyles.nivelCardSubtitleTextStyle.copyWith( // Estilo del texto de "experiencia".
                    fontWeight: FontWeight.bold, // Texto en negrita.
                    color: Colors.white, // Color del texto blanco.
                  ),
                ),
                const SizedBox(height: 5), // Espacio vertical.
                Text(
                  experiencia, // Texto de la experiencia.
                  style: AppStyles.nivelCardSubtitleTextStyle.copyWith( // Estilo del texto de la experiencia.
                    color: Colors.white, // Color del texto blanco.
                  ),
                  textAlign: TextAlign.center, // Alineación del texto al centro.
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}