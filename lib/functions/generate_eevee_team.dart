import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

Future generateEeveeTeam() async {
  var pokemonList = await pokemonListSnapshot();
  setRoleTagTeam(false, "");
  final pokemonTeamA = <int>{};
  final pokemonTeamB = <int>{};
  final pokemonTeam = <int>{};
  int randomEevee = 0;

  if(!legendaries) {
    pokemonList = pokemonList.where((legendary) => legendary['poke_rarity'] == 'Normal').toList();
  }

  final pokemonEevee = pokemonList.where((pokemonDataList) => pokemonDataList['poke_rarity'] == 'Eevee').toList();

  while(pokemonTeamA.length < 5) {
    randomEevee = randomizer.nextInt(pokemonEevee.length);
    if(setTeams(pokemonEevee[randomEevee])) {
      pokemonTeamA.add(randomEevee);
      pokemonTeam.add(randomEevee);
      setTeamPoke(pokemonEevee[pokemonTeamA.last], pokemonTeamA.length - 1);
    }
  }

  while(pokemonTeamB.length < 5) {
    randomEevee = randomizer.nextInt(pokemonEevee.length);
    if(setTeams(pokemonEevee[randomEevee])) {
      pokemonTeamB.add(randomEevee);
      pokemonTeam.add(randomEevee);
      setTeamPoke(pokemonEevee[pokemonTeamB.last], pokemonTeamB.length + 4);
    }
  }

  return pokemonTeam;
}
