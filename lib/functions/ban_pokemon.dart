import 'package:pokehomy/data/generic_data.dart';
import 'package:pokehomy/data/pokemon_list.dart';

void banPokemon() {
  pokemonList[3].pokemon['status'] = 'Baneado';
  print(pokemonList[3].pokemon);
}
