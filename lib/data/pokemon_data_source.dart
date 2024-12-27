import 'package:flutter/material.dart';
import 'package:pokehomy/data/generic_data.dart';
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
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false; // Indica si el conteo de filas es aproximado
  @override
  int get rowCount => pokemonDataSource.length; // Número total de filas
  @override
  int get selectedRowCount => 0; // Número de filas seleccionadas
}
