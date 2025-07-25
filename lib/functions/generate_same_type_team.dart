import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

Future generateSameTypeTeam() async {
  var pokemonList = await pokemonListSnapshot();
  final typeList = await typeListSnapshot();
  final typeTeams = <int>{};
  final pokemonTeamA = <int>{};
  final pokemonTeamB = <int>{};
  final pokemonTeam = <int>{};
  final pokeTypes = typeList.where((typeData) => typeData['type_count'] >= 5).toList();

  int randomType = 0;

  if(!legendaries) {
    pokemonList = pokemonList.where((legendary) => legendary['poke_rarity'] == 'Normal' || legendary['poke_rarity'] == "Eevee").toList();
  }

  setRoleTagTeam(false, "");

  while(typeTeams.length < 2) {
    typeTeams.add(randomizer.nextInt(pokeTypes.length));
  }

  teamPurpleTag = pokeTypes[typeTeams.first]['type_name'];
  teamOrangeTag = pokeTypes[typeTeams.last]['type_name'];

  final pokemonTypeA = pokemonList.where((pokemonDataList) => pokemonDataList['poke_types'].toLowerCase().contains(teamPurpleTag.toLowerCase())).toList();
  final pokemonTypeB = pokemonList.where((pokemonDataList) => pokemonDataList['poke_types'].toLowerCase().contains(teamOrangeTag.toLowerCase())).toList();
  
  while(pokemonTeamA.length < 5) {
    randomType = randomizer.nextInt(pokemonTypeA.length);
    if(setTeams(pokemonTypeA[randomType])) {
      pokemonTeamA.add(randomType);
      pokemonTeam.add(randomType);
      setTeamPoke(pokemonTypeA[pokemonTeamA.last], pokemonTeamA.length - 1);
    }
  }

  while(pokemonTeamB.length < 5) {
    randomType = randomizer.nextInt(pokemonTypeB.length);
    if(setTeams(pokemonTypeB[randomType])) {
      pokemonTeamB.add(randomType);
      pokemonTeam.add(randomType);
      setTeamPoke(pokemonTypeB[pokemonTeamB.last], pokemonTeamB.length + 4);
    }
  }
  return pokemonTeamA;
}
