import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../Open_street_map/openstreetmap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final logger = Logger();

  void _createRoute() {
    final startCity = _startController.text;
    final endCity = _endController.text;
    logger.i('Başlangıç: $startCity, Varış: $endCity');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 24.0),
            child: Text(
              'Rotanızı Oluşturun',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextField(
                  controller: _startController,
                  decoration: InputDecoration(
                    labelText: 'Başlangıç Noktası',
                    prefixIcon: Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 16,
                    ),
                    filled: true,
                    fillColor: Color(0xFFF5F6FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _endController,
                  decoration: InputDecoration(
                    labelText: 'Varış Noktası',
                    prefixIcon: Icon(Icons.circle, color: Colors.red, size: 16),
                    filled: true,
                    fillColor: Color(0xFFF5F6FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF328EEB), // Mavi renk
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _createRoute,
                    icon: Icon(Icons.map, color: Colors.white),
                    label: Text(
                      'Rotayı Oluştur',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Harita widget'ını burada ekleyin
                OpenStreetMap(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
