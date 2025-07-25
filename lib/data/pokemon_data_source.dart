import 'package:flutter/material.dart';
import 'package:pokehomy/data/generic_data.dart';
import 'package:pokehomy/functions/ban_pokemon.dart';
import 'package:pokehomy/models/pokemon.dart';

class PokemonDataSource extends DataTableSource {
  final List<Poke> pokemonDataSource;
  final VoidCallback onRefresh;

  PokemonDataSource(this.pokemonDataSource, this.onRefresh);

  @override
  DataRow? getRow(int index) {
    if(index >= pokemonDataSource.length) return null;
    final pokemon = pokemonDataSource[index];
    return DataRow(
      cells: [
        DataCell(Text(pokemon.nombre)),
        DataCell(Text(pokemon.estatus ? 'Disponible' : "Baneado")),
        DataCell(OutlinedButton(
            onPressed: () {
              _updateValue(pokemon);
              onRefresh();
            },
            style: OutlinedButton.styleFrom(backgroundColor: pokemon.estatus ? banButtonColor : disbanButtonColor, side: const BorderSide(width: 3)),
            child: Text(pokemon.estatus ? banButtonTag : disbanButtonTag, style: const TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }

  void _updateValue(Poke pokemon) async {
    banPokemon(pokemon);
    //notifyListeners(); // Notifica al widget que los datos han cambiado
  }

  @override
  bool get isRowCountApproximate => false; // Indica si el conteo de filas es aproximado
  @override
  int get rowCount => pokemonDataSource.length; // Número total de filas
  @override
  int get selectedRowCount => 0; // Número de filas seleccionadas
}
