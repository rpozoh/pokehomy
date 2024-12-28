import 'package:pokehomy/data/generic_data.dart';
import 'package:pokehomy/functions/generics.dart';

bool setTeams(var pokemonSelected) {
  if(pokemonSelected['types'] == 'Cualquier' && pokemonTeam.where((pokemonTeam) => pokemonTeam.team['name'].contains("Cualquier")).isNotEmpty) {
    return false;
  } else if(pokemonSelected['name'] == "MewtwoX" && pokemonTeam.where((pokemonTeam) => pokemonTeam.team['name'] == "MewtwoY").isNotEmpty) {
    return false;
  } else if(pokemonSelected['name'] == "MewtwoY" && pokemonTeam.where((pokemonTeam) => pokemonTeam.team['name'] == "MewtwoX").isNotEmpty) {
    return false;
  } else if(pokemonSelected['status'] == "Baneado") {
    return false;
  } else {
    return true;
  }
}

void setTeamPoke(Map<String, dynamic> pokemon, int counter) {
  pokemonTeam[counter].team['name'] = pokemon['name'];
  pokemonTeam[counter].team['color'] = setColor(pokemon['role']);
  pokemonTeam[counter].team['role'] = pokemon['role'];
  pokemonTeam[counter].team['image'] = pokemon['image'];
}
