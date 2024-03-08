import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pokehomy/center_text.dart';

class Randomizer extends StatefulWidget {
  const Randomizer({super.key});

  @override
  State<Randomizer> createState() {
    return _RandomizerState();
  }
}

class _RandomizerState extends State<Randomizer> {
  final randomizer = Random();
  var team1Poke1 = 'default';
  var team1Poke2 = 'default';
  var team1Poke3 = 'default';
  var team1Poke4 = 'default';
  var team1Poke5 = 'default';
  var team2Poke1 = 'default';
  var team2Poke2 = 'default';
  var team2Poke3 = 'default';
  var team2Poke4 = 'default';
  var team2Poke5 = 'default';

  List<String> pokemon = [];

  void resetList() {
      pokemon = [
        "absol",
        "aegislash",
        "alolan-ninetales",
        "azumarill",
        "blastoise",
        "blaziken",
        "blissey",
        "buzzwole",
        "chandelure",
        "charizard",
        "cinderace",
        "clefable",
        "comfey",
        "cramorant",
        "crustle",
        "decidueye",
        "delphox",
        "dodrio",
        "dragapult",
        "dragonite",
        "duraludon",
        "eldegoss",
        "espeon",
        "garchomp",
        "gardevoir",
        "gengar",
        "glaceon",
        "goodra",
        "greedent",
        "greninja",
        "gyarados",
        "hoopa",
        "inteleon",
        "lapras",
        "leafeon",
        "lucario",
        "machamp",
        "mamoswine",
        "meowscarada",
        "metagross",
        "mew",
        "mewtwoX",
        "mewtwoY",
        "mimikyu",
        "mr-mime",
        "pikachu",
        "sableye",
        "scizor",
        "slowbro",
        "snorlax",
        "sylveon",
        "talonflame",
        "trevenant",
        "tsareena",
        "tyranitar",
        "umbreon",
        "urshifu",
        "venusaur",
        "wigglytuff",
        "zacian",
        "zeraora",
        "zoroark"
      ];
    }

  void random() {
    int pokemonSeleccionado = 1;
    List<String> equipos = [];
    resetList();
    for(var team = 0; team < 2; team++){
      for(var poke = 0; poke < 5; poke++) {
        pokemonSeleccionado = randomizer.nextInt(pokemon.length);
        if(pokemon[pokemonSeleccionado] == "mewtwoX") {
          equipos.add(pokemon[pokemonSeleccionado]);
          pokemon.removeAt(pokemonSeleccionado + 1);
          pokemon.removeAt(pokemonSeleccionado);
        } else if(pokemon[pokemonSeleccionado] == "mewtwoY") {
          equipos.add(pokemon[pokemonSeleccionado]);
          pokemon.removeAt(pokemonSeleccionado);
          pokemon.removeAt(pokemonSeleccionado - 1);
        } else {
          equipos.add(pokemon[pokemonSeleccionado]);
          pokemon.removeAt(pokemonSeleccionado);
        }
      }
      resetList();
    }

    setState(() {
      team1Poke1 = equipos[0];
      team1Poke2 = equipos[1];
      team1Poke3 = equipos[2];
      team1Poke4 = equipos[3];
      team1Poke5 = equipos[4];
      team2Poke1 = equipos[5];
      team2Poke2 = equipos[6];
      team2Poke3 = equipos[7];
      team2Poke4 = equipos[8];
      team2Poke5 = equipos[9];
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CenterText('Randomizador Pokémon Unite', Colors.yellow, 28),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/$team1Poke1.png'),
            Image.asset('assets/images/$team1Poke2.png'),
            Image.asset('assets/images/$team1Poke3.png'),
            Image.asset('assets/images/$team1Poke4.png'),
            Image.asset('assets/images/$team1Poke5.png'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CenterText(team1Poke1, Colors.yellow, 28),
            const SizedBox(width: 120),
            CenterText(team1Poke2, Colors.yellow, 28),
            const SizedBox(width: 120),
            CenterText(team1Poke3, Colors.yellow, 28),
            const SizedBox(width: 120),
            CenterText(team1Poke4, Colors.yellow, 28),
            const SizedBox(width: 120),
            CenterText(team1Poke5, Colors.yellow, 28),
          ],
        ),
        const CenterText('VS', Colors.yellow, 28),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/$team2Poke1.png'),
            Image.asset('assets/images/$team2Poke2.png'),
            Image.asset('assets/images/$team2Poke3.png'),
            Image.asset('assets/images/$team2Poke4.png'),
            Image.asset('assets/images/$team2Poke5.png'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CenterText(team2Poke1, Colors.yellow, 28),
            const SizedBox(width: 120),
            CenterText(team2Poke2, Colors.yellow, 28),
            const SizedBox(width: 120),
            CenterText(team2Poke3, Colors.yellow, 28),
            const SizedBox(width: 120),
            CenterText(team2Poke4, Colors.yellow, 28),
            const SizedBox(width: 120),
            CenterText(team2Poke5, Colors.yellow, 28),
          ],
        ),
        TextButton(
          onPressed: random,
          child: const Text('Generar Equipos')
        ),
      ],
    );
  }
}
