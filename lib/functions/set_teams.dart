import 'package:pokehomy/data/generic_data.dart';
import 'package:pokehomy/functions/generics.dart';

bool setTeams(var pokemonSelected) {
  if(pokemonSelected['poke_types'] == 'Cualquier' && pokemonTeam.where((pokemonTeam) => pokemonTeam.team['name'].contains("Cualquier")).isNotEmpty) {
    return false;
  } else if(pokemonSelected['poke_name'] == "MewtwoX" && pokemonTeam.where((pokemonTeam) => pokemonTeam.team['name'] == "MewtwoY").isNotEmpty) {
    return false;
  } else if(pokemonSelected['poke_name'] == "MewtwoY" && pokemonTeam.where((pokemonTeam) => pokemonTeam.team['name'] == "MewtwoX").isNotEmpty) {
    return false;
  } else if(pokemonSelected['poke_available'] == false) {
    return false;
  } else {
    return true;
  }
}

void setTeamPoke(Map<String, dynamic> pokemon, int counter) {
  pokemonTeam[counter].team['name'] = pokemon['poke_name'];
  pokemonTeam[counter].team['color'] = setColor(pokemon['poke_role']);
  pokemonTeam[counter].team['role'] = pokemon['poke_role'];
  pokemonTeam[counter].team['image'] = pokemon['poke_image'];
}
