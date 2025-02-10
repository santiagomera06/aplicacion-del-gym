// ignore: file_names
import 'package:flutter/material.dart';

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de depuración
      home:
          DesafiosScreen(), // Establece la pantalla de desafíos como la principal
    );
  }
}

// Pantalla principal de desafíos
class DesafiosScreen extends StatelessWidget {
  const DesafiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Color de fondo negro
      appBar: AppBar(
        backgroundColor: Colors.black, // Color de la barra de aplicación negro
        elevation: 0, // Elimina la sombra debajo de la barra de aplicación
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el título
          children: [
            // Espacio para widgets en la barra de aplicación (actualmente vacío)
          ],
        ),
        centerTitle: true, // Centra el título
      ),
      body: Stack(
        // Usa un Stack para superponer widgets
        children: [
          Positioned.fill(
            // Widget que ocupa todo el espacio disponible
            child: Opacity(
              // Aplica opacidad al fondo
              opacity: 0.2,
              child: Container(
                color: Colors.grey[800], // Color de fondo grisáceo
              ),
            ),
          ),
          Column(
            // Organiza los widgets verticalmente
            children: [
              const SizedBox(height: 10), // Espacio vertical
              const Center(
                // Centra el texto horizontalmente
                child: Text(
                  "Desafíos Sena HealtU",
                  style: TextStyle(
                      color: Colors.green, // Color del texto verde
                      fontSize: 18, // Tamaño de la fuente
                      fontWeight: FontWeight.bold // Texto en negrita
                      ),
                ),
              ),
              const SizedBox(height: 10), // Espacio vertical
              _buildScoreboard(), // Muestra el marcador
              Expanded(
                  child:
                      _buildChallengeNetwork()), // Muestra la red de desafíos (expandido para ocupar el espacio restante)
            ],
          ),
        ],
      ),
      bottomNavigationBar:
          _buildBottomNavigationBar(), // Muestra la barra de navegación inferior
    );
  }

  // Construye el marcador
  Widget _buildScoreboard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), // Padding horizontal
      child: Row(
        // Organiza los widgets horizontalmente
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Distribuye los widgets equitativamente
        children: [
          _scoreCard("Puntuación Actual", "2500",
              Icons.monetization_on), // Tarjeta de puntuación actual
          _scoreCard(
              "Objetivo", "5000", Icons.monetization_on), // Tarjeta de objetivo
        ],
      ),
    );
  }

  // Construye una tarjeta de puntuación
  Widget _scoreCard(String title, String score, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10), // Padding interno
      decoration: BoxDecoration(
        color: Colors.grey[900], // Color de fondo gris oscuro
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
      ),
      child: Row(
        // Organiza los widgets horizontalmente
        children: [
          Icon(icon, color: Colors.yellow, size: 20), // Icono
          const SizedBox(width: 5), // Espacio horizontal
          Column(
            // Organiza los widgets verticalmente
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinea el texto a la izquierda
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 12)), // Título
              Text(score,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)), // Puntuación
            ],
          ),
        ],
      ),
    );
  }

  // Construye la red de desafíos
  Widget _buildChallengeNetwork() {
    return Stack(
      // Usa un Stack para superponer las líneas y los iconos
      alignment: Alignment.center, // Centra los elementos
      children: [
        // Líneas de conexión (se dibujan con _connectionLine)
        _connectionLine(
            const Alignment(-0.4, -0.5), const Alignment(0.4, -0.5)),
        _connectionLine(
            const Alignment(-0.4, -0.3), const Alignment(0.4, -0.3)),
        _connectionLine(
            const Alignment(-0.4, -0.1), const Alignment(0.4, -0.5)),
        _connectionLine(
            const Alignment(-0.4, -0.1), const Alignment(0.4, -0.3)),
        _connectionLine(const Alignment(-0.4, 0.3), const Alignment(0.4, -0.1)),
        _connectionLine(const Alignment(-0.4, 0.3), const Alignment(0.4, 0.5)),

        // Iconos de desafío (se muestran con _challengeIcon, actualmente vacíos)
        _challengeIcon(const Alignment(-0.4, -0.5), ""),
        _challengeIcon(const Alignment(0.4, -0.5), ""),
        _challengeIcon(const Alignment(-0.4, -0.3), ""),
        _challengeIcon(const Alignment(0.4, -0.3), ""),
        _challengeIcon(const Alignment(-0.4, -0.1), ""),
        _challengeIcon(const Alignment(0.4, -0.1), ""),
        _challengeIcon(const Alignment(-0.4, 0.3), ""),
        _challengeIcon(const Alignment(0.4, 0.5), ""),
      ],
    );
  }

  // Dibuja una línea de conexión
  Widget _connectionLine(Alignment start, Alignment end) {
    return Positioned.fill(
      // Ocupa todo el espacio disponible
      child: CustomPaint(
        // Dibuja la línea
        painter: LinePainter(
            start, end), // Usa un CustomPainter para dibujar la línea
      ),
    );
  }

  // Muestra un icono de desafío (actualmente un contenedor vacío)
  Widget _challengeIcon(Alignment alignment, String assetPath) {
    return Align(
      // Alinea el contenedor
      alignment: alignment,
      child: const SizedBox(width: 50), // Contenedor vacío sin imagen
    );
  }

  // Construye la barra de navegación inferior
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black, // Color de fondo negro
      selectedItemColor: Colors.green, // Color de los items seleccionados verde
      unselectedItemColor: Colors
          .white70, // Color de los items no seleccionados blanco con opacidad
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.school), label: "Desafíos"), // Item de desafíos
        BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Clasificación"), // Item de clasificación
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: "Perfil"), // Item de perfil
      ],
    );
  }
}

// Clase para dibujar las líneas de conexión
class LinePainter extends CustomPainter {
  final Alignment start;
  final Alignment end;

  LinePainter(this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green // Color de la línea verde
      ..strokeWidth = 4 // Grosor de la línea
      ..style = PaintingStyle
          .stroke; // Estilo de la línea (stroke para dibujar solo el borde)

    // Calcula los puntos de inicio y fin de la línea
    final startPoint =
        Offset(size.width * (start.x + 1) / 2, size.height * (start.y + 1) / 2);
    final endPoint =
        Offset(size.width * (end.x + 1) / 2, size.height * (end.y + 1) / 2);

    canvas.drawLine(startPoint, endPoint, paint); // Dibuja la línea
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false; // No es necesario redibujar
}
