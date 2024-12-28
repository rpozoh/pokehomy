import 'package:flutter/material.dart';
import 'package:pokehomy/data/generic_data.dart';
import 'package:pokehomy/functions/ban_pokemon.dart';
import 'package:pokehomy/models/pokemon_list.dart';

class PokemonDataSource extends DataTableSource {
  final List<Pokemon> pokemonDataSource = pokemonList;

  @override
  DataRow? getRow(int index) {
    if(index >= pokemonDataSource.length) return null;
    final pokemon = pokemonDataSource[index];
    return DataRow(
      cells: [
        DataCell(Text(pokemon.pokemon['name'])),
        DataCell(Text(pokemon.pokemon['status'])),
        DataCell(OutlinedButton(
            onPressed: () => _updateValue(index),
            style: OutlinedButton.styleFrom(backgroundColor: pokemon.pokemon['status'] == 'Disponible' ? banButtonColor : disbanButtonColor, side: const BorderSide(width: 3)),
            child: Text(pokemon.pokemon['status'] == 'Disponible' ? banButtonTag : disbanButtonTag, style: const TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }

  void _updateValue(int index) {
    banPokemon(index);
    notifyListeners(); // Notifica al widget que los datos han cambiado
  }

  @override
  bool get isRowCountApproximate => false; // Indica si el conteo de filas es aproximado
  @override
  int get rowCount => pokemonDataSource.length; // Número total de filas
  @override
  int get selectedRowCount => 0; // Número de filas seleccionadas
}
