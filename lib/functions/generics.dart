import 'package:flutter/material.dart';
import 'package:pokehomy/data/generic_data.dart';
import 'package:pokehomy/data/pokemon_list.dart';
import 'package:pokehomy/data/pokemon_role.dart';

void setLegendaryPokemon() {
  pokemonList = legendaries ? pokemon : pokemonList.where((legendary) => legendary.pokemon['rarity'] == 'Normal' || legendary.pokemon['rarity'] == "Eevee").toList();
  legendaryTag = legendaries ? legendaryTagTrue : legendaryTagFalse;
  exColor = legendaries ? Colors.red : Colors.green;
  legendaries = legendaries ? false : true;
}

void setEeveeTeam() {
  pokemonList = eevees ? pokemon : pokemonList.where((eevee) => eevee.pokemon['rarity'] == 'Eevee').toList();
  eeveeTag = eevees ? eeveeTagFalse : eeveeTagTrue;
  eeveeColor = eevees ? Colors.red : Colors.green;
  eevees = eevees ? false : true;
}

void setTeamRol() {
  int roleSelected = allRole ? randomizer.nextInt(role.length) : 1;
  selectRole = allRole ? roleList[roleSelected].role['name']! : "Todos";
  roleTag = allRole ? 'Rol: ${roleList[roleSelected].role['name']}' : 'Rol: Todos';
  roleColor = allRole ? setColor(roleList[roleSelected].role['name'].toString()) : Colors.lime;
  pokemonList = allRole ? pokemonList.where((role) => role.pokemon['role'] == roleList[roleSelected].role['name']).toList() : pokemon;
  allRole = allRole ? false : true;
  setRoleTagTeam(allRole, selectRole);
}

void setRoleTagTeam(bool allRoleTag, String role) {
  teamPurpleTag = allRoleTag ? "" : role;
  teamOrangeTag = allRoleTag ? "" : role;
  }

Color setColor(String role) {
  Color color = Colors.white;
  switch(role) {
    case "Ofensivo":
      color = Colors.red;
    case "Equilibrado":
      color = Colors.purple;
    case "Agil":
      color = Colors.blue;
    case "Defensivo":
      color = Colors.green;
    case "Auxiliar":
      color = Colors.yellow;
    case "Siniestro":
      color = const Color.fromARGB(255, 41, 41, 41);
    case "Acero":
      color = const Color.fromARGB(255, 59, 58, 58);
    case "Fantasma":
      color = const Color.fromARGB(255, 69, 39, 82);
    case "Hada":
      color = const Color.fromARGB(255, 218, 123, 154);
    case "Fuego":
      color = Colors.red;
    case "Psíquico":
      color = const Color.fromARGB(255, 163, 31, 123);
    case "Agua":
      color = Colors.blue;
    case "Lucha":
      color = const Color.fromARGB(255, 134, 45, 12);
    case "Volador":
      color = const Color.fromARGB(255, 96, 141, 192);
    case "Planta":
      color = const Color.fromARGB(255, 1, 99, 9);
    case "Dragon":
      color = const Color.fromARGB(255, 17, 11, 85);
  }
  return color;
}

void reOrderTeams() {
  int teamSelected = 0;
  var reOrdererTeam = pokemonTeam;
  for(var poke = 0; poke < 10; poke++) {
    if(poke < 5) {
      teamSelected = randomizer.nextInt(5 - poke);
      reOrdererTeam.add(pokemonTeam[teamSelected]);
      pokemonTeam.removeAt(teamSelected);
    } else if(poke >= 5) {
      teamSelected = randomizer.nextInt(10 - poke);
      reOrdererTeam.add(pokemonTeam[teamSelected]);
      pokemonTeam.removeAt(teamSelected);
    }
  }
  pokemonTeam = reOrdererTeam;
}
