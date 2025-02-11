import 'package:flutter/material.dart';

// Pantalla de Felicitaciones
class PantallaFelicitaciones extends StatelessWidget {
  const PantallaFelicitaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color de fondo de la pantalla
      appBar: AppBar(
        backgroundColor: Colors.white, // Color de fondo de la barra de la app
       
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10), // Espacio vertical
          Center(
            child: Image.asset(
              "assets/trofeo.png", // Ruta de la imagen del trofeo
              height: 200, // Altura de la imagen
            ),
          ),
          const SizedBox(height: 20), // Espacio vertical
          Container(
            width: double.infinity, // Ancho completo del contenedor
            padding: const EdgeInsets.all(20), // Espacio interior del contenedor
            decoration: BoxDecoration(
              color: Colors.green, // Color de fondo verde del contenedor
              borderRadius: BorderRadius.circular(20), // Bordes redondeados
            ),
            child: const Column(
              children: [
                Text(
                  "¡Felicitaciones!", // Texto de felicitaciones
                  style: TextStyle(
                    color: Colors.white, // Color del texto
                    fontSize: 22, // Tamaño de la fuente
                    fontWeight: FontWeight.bold, // Negrita
                  ),
                ),
                SizedBox(height: 10), // Espacio vertical
                _DetallesDesafio(), // Widget separado para los detalles
              ],
            ),
          ),
          const SizedBox(height: 50), // Espacio vertical
          _crearBoton("Ir al siguiente desafío"), // Botón para ir al siguiente desafío
          const SizedBox(height: 50), // Espacio vertical
          _crearBoton("Validar"), // Botón para validar
        ],
      ),
      bottomNavigationBar: _crearBarraNavegacion(), // Barra de navegación inferior
    );
  }

  // Método para crear botones
  static Widget _crearBoton(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50), // Espacio horizontal
      child: ElevatedButton(
        onPressed: () {
          // Lógica del botón aquí
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // Color de fondo del botón
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)), // Bordes redondeados
          padding: const EdgeInsets.symmetric(vertical: 30), // Espacio vertical dentro del botón
        ),
        child: Text(
          texto, // Texto del botón
          style: const TextStyle(
              color: Colors.white, fontSize: 16), // Estilo del texto del botón
        ),
      ),
    );
  }

  // Método para crear la barra de navegación inferior
  Widget _crearBarraNavegacion() {
    return BottomNavigationBar(
      backgroundColor: Colors.green, // Color de fondo de la barra
      selectedItemColor: Colors.white, // Color de los ítems seleccionados
      unselectedItemColor: Colors.white70, // Color de los ítems no seleccionados
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Desafíos"), // Ítem de la barra con icono y texto "Desafíos"
        BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Clasificación"), // Ítem de la barra con icono y texto "Clasificación"
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil"), // Ítem de la barra con icono y texto "Perfil"
      ],
    );
  }
}

// Widget para mostrar los detalles del desafío
class _DetallesDesafio extends StatelessWidget {
  const _DetallesDesafio();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 15), // Espacio interior
      decoration: BoxDecoration(
        color: Colors.white, // Color de fondo del contenedor
        borderRadius: BorderRadius.circular(30), // Bordes redondeados
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribuye los elementos horizontalmente
        children: [
          _ElementoDetalle(
              icon: Icons.timer,
              texto: "2 Horas"), // Ítem de detalle con icono y texto "2 Horas"
          _ElementoDetalle(
              icon: Icons.local_fire_department,
              texto: "300 Calorías"), // Ítem de detalle con icono y texto "300 Calorías"
          _ElementoDetalle(
              icon: Icons.directions_run,
              texto: "Moderado"), // Ítem de detalle con icono y texto "Moderado"
        ],
      ),
    );
  }
}

// Widget para mostrar un elemento de detalle (icono y texto)
class _ElementoDetalle extends StatelessWidget {
  final IconData icon; // Icono del ítem
  final String texto; // Texto del ítem

  const _ElementoDetalle({required this.icon, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.black, size: 24), // Icono del ítem
        const SizedBox(height: 5), // Espacio vertical
        Text(texto,
            style: const TextStyle(color: Colors.black, fontSize: 14)), // Texto del ítem
      ],
    );
  }
}
