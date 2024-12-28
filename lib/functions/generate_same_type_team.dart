import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

import 'package:pokehomy/models/pokemon_list.dart';

void generateSameTypeTeam() {
  setRoleTagTeam(false, "");
  final typeTeams = <int>{};
  final pokemonTeamA = <int>{};
  final pokemonTeamB = <int>{};
  int randomType = 0;
  while(typeTeams.length < 2) {
    typeTeams.add(randomizer.nextInt(typeList.length));
  }
  teamPurpleTag = typeList[typeTeams.first].type['name']!;
  teamOrangeTag = typeList[typeTeams.last].type['name']!;

  List<Pokemon> pokemonType = pokemonList.where((pokemonList) => pokemonList.pokemon['types'].toLowerCase().contains(teamPurpleTag.toLowerCase())).toList();

  while(pokemonTeamA.length < 5) {
    randomType = randomizer.nextInt(pokemonType.length);
    if(setTeams(pokemonType[randomType].pokemon)) {
      pokemonTeamA.add(randomType);
      setTeamPoke(pokemonType[pokemonTeamA.last].pokemon, pokemonTeamA.length - 1);
    }
  }

  pokemonType = pokemonList.where((pokemonList) => pokemonList.pokemon['types'].toLowerCase().contains(teamOrangeTag.toLowerCase())).toList();

  while(pokemonTeamB.length < 5) {
    randomType = randomizer.nextInt(pokemonType.length);
    if(setTeams(pokemonType[randomType].pokemon)) {
      pokemonTeamB.add(randomType);
      setTeamPoke(pokemonType[pokemonTeamB.last].pokemon, pokemonTeamB.length + 4);
    }
  }
}
