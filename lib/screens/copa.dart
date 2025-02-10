import 'package:flutter/material.dart';

// Define un widget sin estado (StatelessWidget) llamado FelicitacionesScreen
// Este widget muestra la pantalla de felicitaciones
class FelicitacionesScreen extends StatelessWidget {
  const FelicitacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Devuelve un Scaffold (estructura básica de una pantalla)
    return Scaffold(
      backgroundColor: Colors.white, // Establece el color de fondo como blanco
      appBar: AppBar(
        // Define la barra de aplicación
        backgroundColor: Colors.white, // Color de fondo blanco
        elevation: 0, // Elimina la sombra debajo de la barra
        leading: IconButton(
          // Icono de flecha para volver atrás
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Aquí va la lógica para volver a la pantalla anterior
            // Por ejemplo: Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        // Usa una columna para organizar los widgets verticalmente
        crossAxisAlignment:
            CrossAxisAlignment.center, // Centra los widgets horizontalmente
        children: [
          const SizedBox(height: 10), // Espacio vertical
          Center(
            // Centra la imagen horizontalmente
            child: Image.asset(
              "assets/trophy.png", // Ruta de la imagen del trofeo (debe estar en assets y declarada en pubspec.yaml)
              height: 200, // Alto de la imagen
            ),
          ),
          const SizedBox(height: 20), // Espacio vertical
          Container(
            // Contenedor para el mensaje de felicitaciones y detalles del desafío
            width: double.infinity, // Ancho completo
            padding: const EdgeInsets.all(20), // Padding interno
            decoration: BoxDecoration(
              color: Colors.green, // Color de fondo verde
              borderRadius: BorderRadius.circular(20), // Bordes redondeados
            ),
            child: const Column(
              // Columna para organizar el texto y los detalles verticalmente
              children: [
                Text(
                  "Felicitaciones!", // Mensaje de felicitaciones
                  style: TextStyle(
                    color: Colors.white, // Color del texto blanco
                    fontSize: 22, // Tamaño de la fuente 22
                    fontWeight: FontWeight.bold, // Texto en negrita
                  ),
                ),
                SizedBox(height: 10), // Espacio vertical
                _ChallengeDetails(), // Detalles del desafío (widget separado)
              ],
            ),
          ),
          const SizedBox(height: 50), // Espacio vertical
          _buildButton(
              "Ir al siguiente desafío"), // Botón para ir al siguiente desafío
          const SizedBox(height: 50), // Espacio vertical
          _buildButton("Validar"), // Botón para validar
        ],
      ),
      bottomNavigationBar:
          _buildBottomNavigationBar(), // Barra de navegación inferior
    );
  }

  // Widget estático para construir botones
  static Widget _buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50), // Padding horizontal
      child: ElevatedButton(
        // Botón elevado
        onPressed: () {
          // Aquí va la lógica para el botón
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // Color de fondo verde
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)), // Bordes redondeados
          padding: const EdgeInsets.symmetric(vertical: 30), // Padding vertical
        ),
        child: Text(
          text, // Texto del botón
          style: const TextStyle(
              color: Colors.white, fontSize: 16), // Estilo del texto
        ),
      ),
    );
  }

  // Widget para construir la barra de navegación inferior
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.green, // Color de fondo verde
      selectedItemColor:
          Colors.white, // Color de los items seleccionados blanco
      unselectedItemColor: Colors
          .white70, // Color de los items no seleccionados blanco con opacidad
      items: const [
        // Items de la barra de navegación
        BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Desafíos"), // Icono de escuela y texto "Desafíos"
        BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Clasificación"), // Icono de evento y texto "Clasificación"
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil"), // Icono de persona y texto "Perfil"
      ],
    );
  }
}

// Widget para mostrar los detalles del desafío
class _ChallengeDetails extends StatelessWidget {
  const _ChallengeDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 15), // Padding interno
      decoration: BoxDecoration(
        color: Colors.white, // Color de fondo blanco
        borderRadius: BorderRadius.circular(30), // Bordes redondeados
      ),
      child: const Row(
        // Fila para organizar los items horizontalmente
        mainAxisAlignment: MainAxisAlignment
            .spaceAround, // Distribuye los items en el espacio disponible
        children: [
          _DetailItem(
              icon: Icons.timer,
              text:
                  "2 Hours"), // Item de detalle con icono de reloj y texto "2 Hours"
          _DetailItem(
              icon: Icons.local_fire_department,
              text:
                  "300 Calories"), // Item de detalle con icono de fuego y texto "300 Calories"
          _DetailItem(
              icon: Icons.directions_run,
              text:
                  "Moderate"), // Item de detalle con icono de correr y texto "Moderate"
        ],
      ),
    );
  }
}

// Widget para mostrar un item de detalle (icono y texto)
class _DetailItem extends StatelessWidget {
  final IconData icon; // Icono
  final String text; // Texto

  const _DetailItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Columna para organizar el icono y el texto verticalmente
      children: [
        Icon(icon, color: Colors.black, size: 24), // Icono
        const SizedBox(height: 5), // Espacio vertical
        Text(text,
            style: const TextStyle(color: Colors.black, fontSize: 14)), // Texto
      ],
    );
  }
}