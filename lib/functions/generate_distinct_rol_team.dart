import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

Future generateDistinctRolTeam() async {
  var pokemonList = await pokemonListSnapshot();
  final roleList = await roleListSnapshot();
  setRoleTagTeam(false, "");
  final roleTeams = <int>{};
  final pokemonTeamA = <int>{};
  final pokemonTeamB = <int>{};
  final pokemonTeam = <int>{};
  int randomRole = 0;

  if(!legendaries) {
    pokemonList = pokemonList.where((legendary) => legendary['poke_rarity'] == 'Normal' || legendary['poke_rarity'] == "Eevee").toList();
  }

  while(roleTeams.length < 2) {
    roleTeams.add(randomizer.nextInt(roleList.length));
  }
  teamPurpleTag = roleList[roleTeams.first]['role_name']!;
  teamOrangeTag = roleList[roleTeams.last]['role_name']!;

  final pokemonRoleA = pokemonList.where((pokemonDataList) => pokemonDataList['poke_role'].toLowerCase() == teamPurpleTag.toLowerCase()).toList();
  final pokemonRoleB = pokemonList.where((pokemonDataList) => pokemonDataList['poke_role'].toLowerCase() == teamOrangeTag.toLowerCase()).toList();

  while(pokemonTeamA.length < 5) {
    randomRole = randomizer.nextInt(pokemonRoleA.length);
    if(setTeams(pokemonRoleA[randomRole])) {
      pokemonTeamA.add(randomRole);
      pokemonTeam.add(randomRole);
      setTeamPoke(pokemonRoleA[pokemonTeamA.last], pokemonTeamA.length - 1);
    }
  }

  while(pokemonTeamB.length < 5) {
    randomRole = randomizer.nextInt(pokemonRoleB.length);
    if(setTeams(pokemonRoleB[randomRole])) {
      pokemonTeamB.add(randomRole);
      pokemonTeam.add(randomRole);
      setTeamPoke(pokemonRoleB[pokemonTeamB.last], pokemonTeamB.length + 4);
    }
  }

  return pokemonTeam;
}
