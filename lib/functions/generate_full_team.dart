import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

void generateFullteam() {
  setRoleTagTeam(false, "");
  final roleTeamA = <int>{};
  final roleTeamB = <int>{};
  final pokemonTeam = <int>{};
  while(roleTeamA.length < 5) {
    roleTeamA.add(randomizer.nextInt(roleList.length));
  }

  while(roleTeamB.length < 5) {
    roleTeamB.add(randomizer.nextInt(roleList.length));
  }

  while(pokemonTeam.length < 10) {
    pokemonTeam.add(randomizer.nextInt(pokemonList.length));
    if(pokemonTeam.length <= 5 && pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon['role'] == roleList[roleTeamA.elementAt(pokemonTeam.length - 1)].role['name'] && setTeams(pokemonTeam.elementAt(pokemonTeam.length - 1), pokemonTeam.length - 1)) {
      setTeamPoke(pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon, pokemonTeam.length - 1);
    } else if(pokemonTeam.length > 5 && pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon['role'] == roleList[roleTeamB.elementAt(pokemonTeam.length - 6)].role['name'] && setTeams(pokemonTeam.elementAt(pokemonTeam.length - 1), pokemonTeam.length - 1)) {
      setTeamPoke(pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon, pokemonTeam.length - 1);
    } else {
      pokemonTeam.remove(pokemonTeam.elementAt(pokemonTeam.length - 1));
    }
  }
}
