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
    if(setTeams(pokemonList[pokemonTeamA.last].pokemon)) {
      setTeamPoke(pokemonList[pokemonTeamA.last].pokemon, pokemonTeamA.length - 1);
    } else {
      pokemonTeamA.remove(pokemonTeamA.last);
    }
  }
  while(pokemonTeamB.length < 5) {
    pokemonTeamB.add(randomizer.nextInt(pokemonList.length));
    if(setTeams(pokemonList[pokemonTeamB.last].pokemon)) {
      setTeamPoke(pokemonList[pokemonTeamB.last].pokemon, pokemonTeamB.length + 4);
    } else {
      pokemonTeamB.remove(pokemonTeamB.last);
    }
  }
  if(!allRole) setTeamRol();
}
