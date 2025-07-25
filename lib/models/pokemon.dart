import 'package:cloud_firestore/cloud_firestore.dart';

class Poke {
  final String id; // ← document ID
  final String nombre;
  final bool estatus;

  Poke({
    required this.id,
    required this.nombre,
    required this.estatus,
  });

  factory Poke.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Poke(
      id: doc.id, // ← Aquí guardas el ID
      nombre: data['poke_name'] ?? '',
      estatus: data['poke_available'] ?? true,
    );
  }
}