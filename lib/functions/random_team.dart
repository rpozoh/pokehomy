import 'dart:math';
import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

void generateRandomTeam() {
  final randomizer = Random();
  setRoleTagTeam(true, "");
  final pokemonTeamA = <int>{};
  final pokemonTeamB = <int>{};
  int randomTeam = 0;

  while(pokemonTeamA.length < 5) {
    randomTeam = randomizer.nextInt(pokemonList.length);
    if(setTeams(pokemonList[randomTeam].pokemon)) {
      pokemonTeamA.add(randomTeam);
      setTeamPoke(pokemonList[pokemonTeamA.last].pokemon, pokemonTeamA.length - 1);
    }
  }

  while(pokemonTeamB.length < 5) {
    randomTeam = randomizer.nextInt(pokemonList.length);
    if(setTeams(pokemonList[randomTeam].pokemon)) {
      pokemonTeamB.add(randomTeam);
      setTeamPoke(pokemonList[pokemonTeamB.last].pokemon, pokemonTeamB.length + 4);
    }
  }
  if(!allRole) setTeamRol();
}
