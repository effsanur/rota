import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

class OpenStreetMap extends StatefulWidget {
  const OpenStreetMap({super.key});

  @override
  State<OpenStreetMap> createState() => _OpenStreetMapState();
}

class _OpenStreetMapState extends State<OpenStreetMap> {
  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Harita yüksekliği
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(39.0, 35.0), // Türkiye'nin ortası
          initialZoom: 6,
          maxZoom: 18,
          // cameraConstraint: CameraConstraint.contain(
          //   bounds: LatLngBounds(
          //     LatLng(35.8, 25.5), // Güneybatı
          //     LatLng(42.0, 44.5), // Kuzeydoğu
          //   ),
          // ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.opentopomap.org/{z}/{x}/{y}.png',
          ),
          CurrentLocationLayer(
            style: const LocationMarkerStyle(
              marker: DefaultLocationMarker(
                child: Icon(Icons.location_pin, color: Colors.white),
              ),
              markerSize: Size(35, 35),
              markerDirection: MarkerDirection.heading,
            ),
          ),
        ],
      ),
    );
  }
}
