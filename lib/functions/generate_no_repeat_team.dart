import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

void generateRandomNoRepeat() {
  setRoleTagTeam(true, "");
  final pokemonTeam = <int>{};
  while(pokemonTeam.length < 10) {
    pokemonTeam.add(randomizer.nextInt(pokemonList.length));
    if(setTeams(pokemonList[pokemonTeam.last].pokemon)) {
      setTeamPoke(pokemonList[pokemonTeam.last].pokemon, pokemonTeam.length - 1);
    } else {
      pokemonTeam.remove(pokemonTeam.last);
    }
  }
  if(!allRole) setTeamRol();
  }
