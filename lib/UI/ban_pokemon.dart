import 'package:flutter/material.dart';
import 'package:pokehomy/data/pokemon_data_source.dart';

void mostrarDialogoPersonalizado(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Cerrar",
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'En construcción',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 8
                        ..color = const Color(0xff3c5aa6),
                    ),
                  ),
                  // Solid text as fill.
                  const Text(
                    'En construcción',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xffffcb05),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox (
                  width: 300,
                  child: PaginatedDataTable(
                    columns: const [
                      DataColumn(label: Text("Nombre", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Estado", style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    source: PokemonDataSource(),
                    rowsPerPage: 10,
                    columnSpacing: 20,
                    showCheckboxColumn: true,
                  ),
                )
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3)),
                child: const Text("Cerrar", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      );
    }
  );
}