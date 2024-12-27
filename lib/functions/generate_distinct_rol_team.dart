import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

void generateDistinctRolTeam() {
  setRoleTagTeam(false, "");
  final roleTeams = <int>{};
  final pokemonTeam = <int>{};
  while(roleTeams.length < 2) {
    roleTeams.add(randomizer.nextInt(roleList.length));
  }
  teamPurpleTag = roleList[roleTeams.elementAt(0)].role['name']!;
  teamOrangeTag = roleList[roleTeams.elementAt(1)].role['name']!;
  while(pokemonTeam.length < 10) {
    pokemonTeam.add(randomizer.nextInt(pokemonList.length));
    if(pokemonTeam.length <= 5 && pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon['role'] == roleList[roleTeams.elementAt(0)].role['name'] && setTeams(pokemonTeam.elementAt(pokemonTeam.length - 1), pokemonTeam.length - 1)) {
      setTeamPoke(pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon, pokemonTeam.length - 1);
    } else if(pokemonTeam.length > 5 && pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon['role'] == roleList[roleTeams.elementAt(1)].role['name'] && setTeams(pokemonTeam.elementAt(pokemonTeam.length - 1), pokemonTeam.length - 1)) {
      setTeamPoke(pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon, pokemonTeam.length - 1);
    } else {
      pokemonTeam.remove(pokemonTeam.elementAt(pokemonTeam.length - 1));
    }
  }
}
