import 'package:pokehomy/functions/set_teams.dart';
import 'package:pokehomy/functions/generics.dart';
import 'package:pokehomy/data/generic_data.dart';

void generateSameTypeTeam() {
  setRoleTagTeam(false, "");
  final typeTeams = <int>{};
  final pokemonTeam = <int>{};
  while(typeTeams.length < 2) {
    typeTeams.add(randomizer.nextInt(typeList.length));
  }
  teamPurpleTag = typeList[typeTeams.elementAt(0)].type['name']!;
  teamOrangeTag = typeList[typeTeams.elementAt(1)].type['name']!;
  while(pokemonTeam.length < 10) {
    pokemonTeam.add(randomizer.nextInt(pokemonList.length));
    if(pokemonTeam.length <= 5 && pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon['types'].toString().contains(typeList[typeTeams.elementAt(0)].type['name']!) && setTeams(pokemonTeam.elementAt(pokemonTeam.length - 1), pokemonTeam.length - 1)) {
      setTeamPoke(pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon, pokemonTeam.length - 1);
    } else if(pokemonTeam.length > 5 && pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon['types'].toString().contains(typeList[typeTeams.elementAt(1)].type['name']!) && setTeams(pokemonTeam.elementAt(pokemonTeam.length - 1), pokemonTeam.length - 1)) {
      setTeamPoke(pokemonList[pokemonTeam.elementAt(pokemonTeam.length - 1)].pokemon, pokemonTeam.length - 1);
    } else {
      pokemonTeam.remove(pokemonTeam.elementAt(pokemonTeam.length - 1));
    }
  }
}