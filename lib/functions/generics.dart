import 'package:flutter/material.dart';
import 'package:pokehomy/data/generic_data.dart';
import 'package:pokehomy/data/pokemon_list.dart';
import 'package:pokehomy/data/pokemon_role.dart';

void setPokemonEx() {
  if(exs) {
    pokemonList = pokemonList.where((ex) => ex.pokemon['rarity'] == 'normal').toList();
    exTag = "Sin Ex";
    exColor = Colors.green;
    exs = false;
  } else {
    exTag = "Con Ex";
    exColor = Colors.red;
    exs = true;
    pokemonList = pokemon;
  }
}

void setTeamRol() {
  int roleSelected = 1;
  if(allRole) {
    roleSelected = randomizer.nextInt(role.length);
    roleTag = 'Rol: ${roleList[roleSelected].role['name']}';
    pokemonList = pokemonList.where((role) => role.pokemon['role'] == roleList[roleSelected].role['name']).toList();
    roleColor = setColor(roleList[roleSelected].role['name'].toString());
    allRole = false;
  } else {
    selectRole = "Todos";
    roleTag = 'Rol: Todos';
    roleColor = Colors.lime;
    allRole = true;
    pokemonList = pokemon;
  }
}

void setRoleTagTeam(bool allRoleTag, String role) {
    if(!allRoleTag) {
      teamPurpleTag = role;
      teamOrangeTag = role;
    } else {
      teamPurpleTag = "";
      teamOrangeTag = "";
    }
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
