import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

Future generateSameRolTeam() async {
  var pokemonList = await pokemonListSnapshot();
  final roleList = await roleListSnapshot();
  setRoleTagTeam(false, "");
  final pokemonTeamA = <int>{};
  final pokemonTeamB = <int>{};
  final pokemonTeam = <int>{};
  int randomRole = 0;

  if(!legendaries) {
    pokemonList = pokemonList.where((legendary) => legendary['poke_rarity'] == 'Normal' || legendary['poke_rarity'] == "Eevee").toList();
  }

  final teamsRole = randomizer.nextInt(roleList.length);
  teamPurpleTag = roleList[teamsRole]['role_name']!;
  teamOrangeTag = roleList[teamsRole]['role_name']!;
  setTeamRol(roleList[teamsRole]['role_name']!);

  final pokemonRole = pokemonList.where((pokemonDataList) => pokemonDataList['poke_role'].toLowerCase() == teamPurpleTag.toLowerCase()).toList();

  while(pokemonTeamA.length < 5) {
    randomRole = randomizer.nextInt(pokemonRole.length);
    if(setTeams(pokemonRole[randomRole])) {
      pokemonTeamA.add(randomRole);
      pokemonTeam.add(randomRole);
      setTeamPoke(pokemonRole[pokemonTeamA.last], pokemonTeamA.length - 1);
    }
  }

  while(pokemonTeamB.length < 5) {
    randomRole = randomizer.nextInt(pokemonRole.length);
    if(setTeams(pokemonRole[randomRole])) {
      pokemonTeamB.add(randomRole);
      pokemonTeam.add(randomRole);
      setTeamPoke(pokemonRole[pokemonTeamB.last], pokemonTeamB.length + 4);
    }
  }

  return pokemonTeam;
}
