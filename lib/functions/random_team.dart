import 'dart:math';
import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

Future generateRandomTeam() async {
  var pokemonList = await pokemonListSnapshot();
  final randomizer = Random();
  setRoleTagTeam(true, "");
  final pokemonTeamA = <int>{};
  final pokemonTeamB = <int>{};
  final pokemonTeam = <int>{};
  int randomTeam = 0;

  if(!legendaries) {
    pokemonList = pokemonList.where((pokemonDataList) => pokemonDataList['poke_rarity'] == 'Normal' || pokemonDataList['poke_rarity'] == "Eevee").toList();
  }
  
  while(pokemonTeamA.length < 5) {
    randomTeam = randomizer.nextInt(pokemonList.length);
    if(setTeams(pokemonList[randomTeam])) {
      pokemonTeamA.add(randomTeam);
      pokemonTeam.add(randomTeam);
      setTeamPoke(pokemonList[pokemonTeamA.last], pokemonTeamA.length - 1);
    }
  }

  while(pokemonTeamB.length < 5) {
    randomTeam = randomizer.nextInt(pokemonList.length);
    if(setTeams(pokemonList[randomTeam])) {
      pokemonTeamB.add(randomTeam);
      pokemonTeam.add(randomTeam);
      setTeamPoke(pokemonList[pokemonTeamB.last], pokemonTeamB.length + 4);
    }
  }

  return pokemonTeam;
}
