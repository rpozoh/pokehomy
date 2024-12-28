import 'package:pokehomy/data/generic_data.dart';

void banPokemon(int index) {
  pokemonList[index].pokemon['status'] = pokemonList[index].pokemon['status'] == 'Baneado' ? 'Disponible' : 'Baneado';
  currentBanStatus = pokemonList[index].pokemon['status'] == 'Baneado' ? disbanButtonTag : banButtonTag;
  currentBanButtonColor = pokemonList[index].pokemon['status'] == 'Baneado' ? disbanButtonColor : banButtonColor;
}