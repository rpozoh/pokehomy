import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

Future generateRandomNoRepeat() async {
  var pokemonList = await pokemonListSnapshot();
  setRoleTagTeam(true, "");
  final pokemonTeam = <int>{};
  int randomTeam = 0;

  if(!legendaries) {
    pokemonList = pokemonList.where((legendary) => legendary['poke_rarity'] == 'Normal' || legendary['poke_rarity'] == "Eevee").toList();
  }

  while(pokemonTeam.length < 10) {
    randomTeam = randomizer.nextInt(pokemonList.length);
    if(setTeams(pokemonList[randomTeam])) {
      pokemonTeam.add(randomTeam);
      setTeamPoke(pokemonList[pokemonTeam.last], pokemonTeam.length - 1);
    }
  }

  return pokemonTeam;
}
