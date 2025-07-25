import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

Future generateFullteam() async {
  var pokemonList = await pokemonListSnapshot();
  final roleList = await roleListSnapshot();
  setRoleTagTeam(false, "");
  final roleTeamA = <int>{};
  final roleTeamB = <int>{};
  final pokemonTeam = <int>{};

  if(!legendaries) {
    pokemonList = pokemonList.where((legendary) => legendary['poke_rarity'] == 'Normal' || legendary['poke_rarity'] == "Eevee").toList();
  }

  while(roleTeamA.length < 5) {
    roleTeamA.add(randomizer.nextInt(roleList.length));
  }

  while(roleTeamB.length < 5) {
    roleTeamB.add(randomizer.nextInt(roleList.length));
  }

  while(pokemonTeam.length < 10) {
    pokemonTeam.add(randomizer.nextInt(pokemonList.length));
    if(pokemonTeam.length <= 5 && pokemonList[pokemonTeam.last]['poke_role'] == roleList[roleTeamA.elementAt(pokemonTeam.length - 1)]['role_name'] && setTeams(pokemonList[pokemonTeam.last])) {
      setTeamPoke(pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)], pokemonTeam.length - 1);
    } else if(pokemonTeam.length > 5 && pokemonList[pokemonTeam.last]['poke_role'] == roleList[roleTeamB.elementAt(pokemonTeam.length - 6)]['role_name'] && setTeams(pokemonList[pokemonTeam.last])) {
      setTeamPoke(pokemonList[pokemonTeam.last], pokemonTeam.length - 1);
    } else {
      pokemonTeam.remove(pokemonTeam.last);
    }
  }
  return pokemonTeam;
}
