import 'package:flutter/material.dart';
import '../app_styles.dart'; // Importa estilos personalizados desde un archivo local.

// Este widget representa la pantalla principal para mostrar los niveles.
class PantallaNivel extends StatefulWidget {
  const PantallaNivel({super.key});

  @override
  _PantallaNivelState createState() => _PantallaNivelState();
}

// Estado de la pantalla principal de niveles.
class _PantallaNivelState extends State<PantallaNivel> {
  // Índice seleccionado en la barra de navegación inferior. Inicializado en 1.
  int _indiceSeleccionado = 1;

  // Función que se llama al tocar un elemento de la barra de navegación.
  void _alTocarElemento(int index) {
    setState(() {
      _indiceSeleccionado = index; // Actualiza el índice seleccionado.
      // Aquí podrías agregar la lógica para navegar a otras pantallas según el índice.
      // Por ejemplo:
      // if (index == 0) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaDesafios()));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Establece el fondo negro.
      appBar: AppBar(
        backgroundColor: Colors.black, // Color de la barra de la app.
        elevation: 0, // Elimina la sombra debajo de la barra de la app.
        leading: const Icon(Icons.person, color: Colors.green), // Icono de perfil a la izquierda.
        title: const Row(
          children: [
            Text(
              'Usuario',
              style: AppStyles.userTextStyle, // Estilo para el texto de usuario.
            ),
            Spacer(), // Espacio flexible para empujar el icono de menú a la derecha.
            Icon(Icons.menu, color: Colors.green), // Icono de menú a la derecha.
          ],
        ),
      ),
      body: const SingleChildScrollView(
        // Permite hacer scroll si el contenido es más largo que la pantalla.
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30), // Espacio alrededor del contenido.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Centra horizontalmente.
            children: [
              Text(
                'Nivel',
                style: AppStyles.nivelTextStyle, // Estilo para el título "Nivel".
              ),
              SizedBox(height: 50), // Espacio vertical de 50 píxeles.
              TarjetaNivel(
                nivel: 'Principiante', // Nivel de experiencia.
                experiencia: 'Menos de 6 meses\nde experiencia', // Descripción de experiencia.
              ),
              SizedBox(height: 50), // Espacio vertical.
              TarjetaNivel(
                nivel: 'Intermedio',
                experiencia: 'Más de 6 meses y\nmenos de 2 años',
              ),
              SizedBox(height: 50), // Espacio vertical.
              TarjetaNivel(
                nivel: 'Avanzado',
                experiencia: 'Más de 2 años',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Barra de navegación inferior.
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Desafíos', // Etiqueta del primer ítem.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Clasificación', // Etiqueta del segundo ítem.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil', // Etiqueta del tercer ítem.
          ),
        ],
        currentIndex: _indiceSeleccionado, // Índice del elemento seleccionado actualmente.
        selectedItemColor: Colors.white, // Color para el ítem seleccionado.
        unselectedItemColor: Colors.white70, // Color para los ítems no seleccionados.
        backgroundColor: Colors.green, // Color de fondo de la barra de navegación.
        onTap: _alTocarElemento, // Llama a la función al tocar un ítem.
        type: BottomNavigationBarType.fixed, // Tipo de barra (fija).
        iconSize: 28, // Tamaño de los iconos.
      ),
    );
  }
}

// Widget para mostrar cada tarjeta de nivel.
class TarjetaNivel extends StatelessWidget {
  final String nivel; // Texto del nivel (e.g., "Principiante").
  final String experiencia; // Descripción de la experiencia asociada al nivel.

  const TarjetaNivel({
    super.key,
    required this.nivel,
    required this.experiencia,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Contenedor para el lado izquierdo (nivel).
        Expanded(
          flex: 2, // Define la proporción del espacio que ocupa.
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Espacio interno.
            decoration: const BoxDecoration(
              color: Colors.black87, // Color de fondo.
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), // Bordes redondeados en las esquinas superiores.
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Text(
              nivel, // Muestra el nivel.
              style: AppStyles.nivelCardTitleTextStyle, // Estilo del texto del nivel.
              textAlign: TextAlign.center, // Centra el texto.
            ),
          ),
        ),
        // Contenedor para el lado derecho (experiencia).
        Expanded(
          flex: 3, // Define la proporción del espacio que ocupa.
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Espacio interno.
            decoration: const BoxDecoration(
              color: Colors.green, // Color de fondo verde.
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), // Bordes redondeados en las esquinas superiores.
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Centra horizontalmente.
              children: [
                Text(
                  'Experiencia', // Título de la sección.
                  style: AppStyles.nivelCardSubtitleTextStyle.copyWith(
                    fontWeight: FontWeight.bold, // Texto en negrita.
                    color: Colors.white, // Color del texto.
                  ),
                ),
                const SizedBox(height: 5), // Espacio vertical.
                Text(
                  experiencia, // Muestra la descripción de la experiencia.
                  style: AppStyles.nivelCardSubtitleTextStyle.copyWith(
                    color: Colors.white, // Color del texto.
                  ),
                  textAlign: TextAlign.center, // Centra el texto.
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
