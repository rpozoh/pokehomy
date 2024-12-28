import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

void generateRandomNoRepeat() {
  setRoleTagTeam(true, "");
  final pokemonTeam = <int>{};
  int randomTeam = 0;
  while(pokemonTeam.length < 10) {
    randomTeam = randomizer.nextInt(pokemonList.length);
    if(setTeams(pokemonList[randomTeam].pokemon)) {
      pokemonTeam.add(randomTeam);
      setTeamPoke(pokemonList[pokemonTeam.last].pokemon, pokemonTeam.length - 1);
    }
  }
  if(!allRole) setTeamRol();
}
