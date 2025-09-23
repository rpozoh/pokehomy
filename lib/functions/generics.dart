import 'package:flutter/material.dart';
import 'package:pokehomy/data/generic_data.dart';

void setLegendaryPokemon() {
  legendaryTag = legendaries ? legendaryTagFalse : legendaryTagTrue;
  exColor = legendaries ? Colors.green : Colors.red;
  legendaries = legendaries ? false : true;
}

Future setTeamRol(String roleName) async {
  roleColor = allRole ? setColor(roleName) : Colors.lime;
}

void setRoleTagTeam(bool allRoleTag, String role) {
  teamPurpleTag = allRoleTag ? role : "";
  teamOrangeTag = allRoleTag ? role : "";
}

Color setColor(String role) {
  Color color = const Color.fromARGB(255, 255, 255, 255);
  switch(role) {
    case "Ofensivo":
      color = const Color.fromARGB(255, 255, 17, 0);
    case "Equilibrado":
      color = const Color.fromARGB(255, 105, 8, 122);
    case "Ágil":
      color = const Color.fromARGB(255, 1, 100, 182);
    case "Defensivo":
      color = const Color.fromARGB(255, 93, 216, 97);
    case "Auxiliar":
      color = const Color.fromARGB(255, 255, 235, 59);
    case "Siniestro":
      color = const Color.fromARGB(255, 41, 41, 41);
    case "Acero":
      color = const Color.fromARGB(255, 59, 58, 58);
    case "Fantasma":
      color = const Color.fromARGB(255, 69, 39, 82);
    case "Hada":
      color = const Color.fromARGB(255, 218, 123, 154);
    case "Fuego":
      color = const Color.fromARGB(255, 226, 97, 10);
    case "Psíquico":
      color = const Color.fromARGB(255, 163, 31, 123);
    case "Agua":
      color = const Color.fromARGB(255, 0, 118, 214);
    case "Lucha":
      color = const Color.fromARGB(255, 134, 45, 12);
    case "Volador":
      color = const Color.fromARGB(255, 96, 141, 192);
    case "Planta":
      color = const Color.fromARGB(255, 1, 99, 9);
    case "Dragón":
      color = const Color.fromARGB(255, 17, 11, 85);
    case "Eléctrico":
      color = const Color.fromARGB(255, 255, 235, 59);
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
