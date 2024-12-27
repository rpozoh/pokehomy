import 'dart:math';
import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

void generateRandomTeam() {
  final randomizer = Random();
  setRoleTagTeam(true, "");
  final pokemonTeamA = <int>{};
  final pokemonTeamB = <int>{};
  while(pokemonTeamA.length < 5) {
    pokemonTeamA.add(randomizer.nextInt(pokemonList.length));
    if(setTeams(pokemonTeamA.elementAt(pokemonTeamA.length - 1), pokemonTeamA.length - 1)) {
      setTeamPoke(pokemonList[pokemonTeamA.elementAt(pokemonTeamA.length - 1)].pokemon, pokemonTeamA.length - 1);
    } else {
      pokemonTeamA.remove(pokemonTeamA.elementAt(pokemonTeamA.length - 1));
    }
  }
  while(pokemonTeamB.length < 5) {
    pokemonTeamB.add(randomizer.nextInt(pokemonList.length));
    if(setTeams(pokemonTeamB.elementAt(pokemonTeamB.length - 1), pokemonTeamB.length + 4)) {
      setTeamPoke(pokemonList[pokemonTeamB.elementAt(pokemonTeamB.length - 1)].pokemon, pokemonTeamB.length + 4);
    } else {
      pokemonTeamB.remove(pokemonTeamB.elementAt(pokemonTeamB.length - 1));
    }
  }
  if(!allRole) setTeamRol();
}
