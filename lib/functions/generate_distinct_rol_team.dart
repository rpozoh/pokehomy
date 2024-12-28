import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

import 'package:pokehomy/models/pokemon_list.dart';

void generateDistinctRolTeam() {
  setRoleTagTeam(false, "");
  final roleTeams = <int>{};
  final pokemonTeamA = <int>{};
  final pokemonTeamB = <int>{};
  int randomRole = 0;
  while(roleTeams.length < 2) {
    roleTeams.add(randomizer.nextInt(roleList.length));
  }
  teamPurpleTag = roleList[roleTeams.first].role['name']!;
  teamOrangeTag = roleList[roleTeams.last].role['name']!;

  List<Pokemon> pokemonRole = pokemonList.where((pokemonList) => pokemonList.pokemon['role'].toLowerCase() == teamPurpleTag.toLowerCase()).toList();

  while(pokemonTeamA.length < 5) {
    randomRole = randomizer.nextInt(pokemonRole.length);
    if(setTeams(pokemonRole[randomRole].pokemon)) {
      pokemonTeamA.add(randomRole);
      setTeamPoke(pokemonRole[pokemonTeamA.last].pokemon, pokemonTeamA.length - 1);
    }
  }

  pokemonRole = pokemonList.where((pokemonList) => pokemonList.pokemon['role'].toLowerCase() == teamOrangeTag.toLowerCase()).toList();

  while(pokemonTeamB.length < 5) {
    randomRole = randomizer.nextInt(pokemonRole.length);
    if(setTeams(pokemonRole[randomRole].pokemon)) {
      pokemonTeamB.add(randomRole);
      setTeamPoke(pokemonRole[pokemonTeamB.last].pokemon, pokemonTeamB.length + 4);
    }
  }
}
