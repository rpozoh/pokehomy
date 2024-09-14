import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class Randomizer extends StatefulWidget {
  const Randomizer({super.key});

  @override
  State<Randomizer> createState() {
    return _RandomizerState();
  }
}

class _RandomizerState extends State<Randomizer> {
  final randomizer = Random();
  List<Map<String, dynamic>> teams = [
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"},
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"},
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"},
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"},
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"},
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"},
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"},
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"},
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"},
    {"name":"Default", "color":Colors.red, "image":"assets/images/default.png"}
  ];

  List<Map<String, dynamic>> pokemon = [];

  List<String> rols = [];

  var exTag = "Con Ex";
  var exs = true;

  var rolTag = "Rol: Todos";
  var selectRol = "Todos";
  var allRol = true;

  Color rolColor = Colors.lime;
  Color exColor = Colors.red;

  final Uri _url = Uri.parse('https://www.twitch.tv/rphisto');

  void resetList() {
    pokemon = [
      {"name":"Absol", "rol":"Agil", "type":"normal", "image":"assets/images/absol.png"},
      {"name":"Aegislash", "rol":"Equilibrado", "type":"normal", "image":"assets/images/aegislash.png"},
      {"name":"Alolan-ninetales", "rol":"Ofensivo", "type":"normal", "image":"assets/images/alolan-ninetales.png"},
      {"name":"Armarouge", "rol":"Ofensivo", "type":"normal", "image":"assets/images/armarouge.png"},
      {"name":"Azumarill", "rol":"Equilibrado", "type":"normal", "image":"assets/images/azumarill.png"},
      {"name":"Blastoise", "rol":"Defensivo", "type":"normal", "image":"assets/images/blastoise.png"},
      {"name":"Blaziken", "rol":"Equilibrado", "type":"normal", "image":"assets/images/blaziken.png"},
      {"name":"Blissey", "rol":"Auxiliar", "type":"normal", "image":"assets/images/blissey.png"},
      {"name":"Buzzwole", "rol":"Equilibrado", "type":"normal", "image":"assets/images/buzzwole.png"},
      {"name":"Ceruledge", "rol":"Equilibrado", "type":"normal", "image":"assets/images/ceruledge.png"},
      {"name":"Chandelure", "rol":"Ofensivo", "type":"normal", "image":"assets/images/chandelure.png"},
      {"name":"Charizard", "rol":"Equilibrado", "type":"normal", "image":"assets/images/charizard.png"},
      {"name":"Cinderace", "rol":"Ofensivo", "type":"normal", "image":"assets/images/cinderace.png"},
      {"name":"Clefable", "rol":"Auxiliar", "type":"normal", "image":"assets/images/clefable.png"},
      {"name":"Comfey", "rol":"Auxiliar", "type":"normal", "image":"assets/images/comfey.png"},
      {"name":"Cramorant", "rol":"Ofensivo", "type":"normal", "image":"assets/images/cramorant.png"},
      {"name":"Crustle", "rol":"Defensivo", "type":"normal", "image":"assets/images/crustle.png"},
      {"name":"Decidueye", "rol":"Ofensivo", "type":"normal", "image":"assets/images/decidueye.png"},
      {"name":"Delphox", "rol":"Ofensivo", "type":"normal", "image":"assets/images/delphox.png"},
      {"name":"Dodrio", "rol":"Agil", "type":"normal", "image":"assets/images/dodrio.png"},
      {"name":"Dragapult", "rol":"Ofensivo", "type":"normal", "image":"assets/images/dragapult.png"},
      {"name":"Dragonite", "rol":"Equilibrado", "type":"normal", "image":"assets/images/dragonite.png"},
      {"name":"Duraludon", "rol":"Ofensivo", "type":"normal", "image":"assets/images/duraludon.png"},
      {"name":"Eldegoss", "rol":"Auxiliar", "type":"normal", "image":"assets/images/eldegoss.png"},
      {"name":"Espeon", "rol":"Ofensivo", "type":"normal", "image":"assets/images/espeon.png"},
      {"name":"Falinks", "rol":"Equilibrado", "type":"normal", "image":"assets/images/falinks.png"},
      {"name":"Garchomp", "rol":"Equilibrado", "type":"normal", "image":"assets/images/garchomp.png"},
      {"name":"Gardevoir", "rol":"Ofensivo", "type":"normal", "image":"assets/images/gardevoir.png"},
      {"name":"Gengar", "rol":"Agil", "type":"normal", "image":"assets/images/gengar.png"},
      {"name":"Glaceon", "rol":"Ofensivo", "type":"normal", "image":"assets/images/glaceon.png"},
      {"name":"Goodra", "rol":"Defensivo", "type":"normal", "image":"assets/images/goodra.png"},
      {"name":"Greedent", "rol":"Defensivo", "type":"normal", "image":"assets/images/greedent.png"},
      {"name":"Greninja", "rol":"Ofensivo", "type":"normal", "image":"assets/images/greninja.png"},
      {"name":"Gyarados", "rol":"Equilibrado", "type":"normal", "image":"assets/images/gyarados.png"},
      {"name":"Ho-Oh", "rol":"Defensivo", "type":"ex", "image":"assets/images/ho-oh.png"},
      {"name":"Hoopa", "rol":"Auxiliar", "type":"normal", "image":"assets/images/hoopa.png"},
      {"name":"Inteleon", "rol":"Ofensivo", "type":"normal", "image":"assets/images/inteleon.png"},
      {"name":"Lapras", "rol":"Defensivo", "type":"normal", "image":"assets/images/lapras.png"},
      {"name":"Leafeon", "rol":"Agil", "type":"normal", "image":"assets/images/leafeon.png"},
      {"name":"Lucario", "rol":"Equilibrado", "type":"normal", "image":"assets/images/lucario.png"},
      {"name":"Machamp", "rol":"Equilibrado", "type":"normal", "image":"assets/images/machamp.png"},
      {"name":"Mamoswine", "rol":"Defensivo", "type":"normal", "image":"assets/images/mamoswine.png"},
      {"name":"Meowscarada", "rol":"Agil", "type":"normal", "image":"assets/images/meowscarada.png"},
      {"name":"Metagross", "rol":"Equilibrado", "type":"normal", "image":"assets/images/metagross.png"},
      {"name":"Mew", "rol":"Ofensivo", "type":"normal", "image":"assets/images/mew.png"},
      {"name":"MewtwoX", "rol":"Equilibrado", "type":"ex", "image":"assets/images/mewtwoX.png"},
      {"name":"MewtwoY", "rol":"Ofensivo", "type":"ex", "image":"assets/images/mewtwoY.png"},
      {"name":"Mimikyu", "rol":"Equilibrado", "type":"normal", "image":"assets/images/mimikyu.png"},
      {"name":"Miraidon", "rol":"Ofensivo", "type":"ex", "image":"assets/images/miraidon.png"},
      {"name":"Mr.mime", "rol":"Auxiliar", "type":"normal", "image":"assets/images/mr-mime.png"},
      {"name":"Pikachu", "rol":"Ofensivo", "type":"normal", "image":"assets/images/pikachu.png"},
      {"name":"Sableye", "rol":"Auxiliar", "type":"normal", "image":"assets/images/sableye.png"},
      {"name":"Scizor", "rol":"Equilibrado", "type":"normal", "image":"assets/images/scizor.png"},
      {"name":"Slowbro", "rol":"Defensivo", "type":"normal", "image":"assets/images/slowbro.png"},
      {"name":"Snorlax", "rol":"Defensivo", "type":"normal", "image":"assets/images/snorlax.png"},
      {"name":"Sylveon", "rol":"Ofensivo", "type":"normal", "image":"assets/images/sylveon.png"},
      {"name":"Talonflame", "rol":"Agil", "type":"normal", "image":"assets/images/talonflame.png"},
      {"name":"Trevenant", "rol":"Defensivo", "type":"normal", "image":"assets/images/trevenant.png"},
      {"name":"Tsareena", "rol":"Equilibrado", "type":"normal", "image":"assets/images/tsareena.png"},
      {"name":"Tyranitar", "rol":"Equilibrado", "type":"normal", "image":"assets/images/tyranitar.png"},
      {"name":"Umbreon", "rol":"Defensivo", "type":"normal", "image":"assets/images/umbreon.png"},
      {"name":"Urshifu", "rol":"Equilibrado", "type":"normal", "image":"assets/images/urshifu.png"},
      {"name":"Venusaur", "rol":"Ofensivo", "type":"normal", "image":"assets/images/venusaur.png"},
      {"name":"Wigglytuff", "rol":"Auxiliar", "type":"normal", "image":"assets/images/wigglytuff.png"},
      {"name":"Zacian", "rol":"Equilibrado", "type":"ex", "image":"assets/images/zacian.png"},
      {"name":"Zeraora", "rol":"Agil", "type":"normal", "image":"assets/images/zeraora.png"},
      {"name":"Zoroark", "rol":"Agil", "type":"normal", "image":"assets/images/zoroark.png"}
    ];
  }

  void setRolList() {
    rols = [
      "Ofensivo",
      "Agil",
      "Equilibrado",
      "Defensivo",
      "Auxiliar"
    ];
  }

  void random() {
    setState(() {
      int counter = 0;
      int pokemonSeleccionado = 1;
      setPoke();
      setRolList();
      for(var team = 1; team <= 2; team++) {
        for(var poke = 1; poke <= 5; poke++) {
          pokemonSeleccionado = randomizer.nextInt(pokemon.length);
          setTeams(pokemonSeleccionado, counter);
          counter++;
        }
        setPoke();
      }
    });
  }

  void randomNoRepeat() {
    setState(() {
      int pokemonSeleccionado = 1;
      setPoke();
      setRolList();
      for(var poke = 0; poke < 10; poke++) {
        pokemonSeleccionado = randomizer.nextInt(pokemon.length);
        setTeams(pokemonSeleccionado, poke);
      }
      setPoke();
    });
  }

  void fullteam() {
    setState(() {
      List<Map<String, dynamic>> fullTeam = [];
      int pokemonSeleccionado = 1;
      int rolSeleccionado = 1;
      setPoke();
      setRolList();
      for(var poke = 0; poke < 10; poke++) {
        if(poke == 5) {
          setRolList();
        }
        rolSeleccionado = randomizer.nextInt(rols.length);
        fullTeam = pokemon.where((pokes) => pokes['rol'] == rols[rolSeleccionado]).toList();
        pokemonSeleccionado = randomizer.nextInt(fullTeam.length);
        if(fullTeam[pokemonSeleccionado]['name'] == "MewtwoX") {
          setTeamPoke(poke, fullTeam[pokemonSeleccionado]);
          pokemon.removeWhere((element) => element['name'] == fullTeam[pokemonSeleccionado]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoY');
          rols.removeAt(rolSeleccionado);
        } else if(fullTeam[pokemonSeleccionado]['name'] == "MewtwoY") {
          setTeamPoke(poke, fullTeam[pokemonSeleccionado]);
          pokemon.removeWhere((element) => element['name'] == fullTeam[pokemonSeleccionado]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoX');
          rols.removeAt(rolSeleccionado);
        } else {
          setTeamPoke(poke, fullTeam[pokemonSeleccionado]);
          pokemon.removeWhere((element) => element['name'] == fullTeam[pokemonSeleccionado]['name']);
          rols.removeAt(rolSeleccionado);
        }
      }
    });
  }

  void distinctRol() {
    setState(() {
      int pokemonSeleccionado = 1;
      int rolSeleccionado = 1;
      List<Map<String, dynamic>> rolTeam = [];
      setRolList();
      setPoke();
      for(var poke = 0; poke < 10; poke++) {
        if(poke == 0 || poke == 5) {
          setPoke();
          rolSeleccionado = randomizer.nextInt(rols.length);
        }
        rolTeam = pokemon.where((pokes) => pokes['rol'] == rols[rolSeleccionado]).toList();
        pokemonSeleccionado = randomizer.nextInt(rolTeam.length);
        if(rolTeam[pokemonSeleccionado]['name'] == "MewtwoX") {
          setTeamPoke(poke, rolTeam[pokemonSeleccionado]);
          pokemon.removeWhere((element) => element['name'] == rolTeam[pokemonSeleccionado]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoY');
        } else if(rolTeam[pokemonSeleccionado]['name'] == "MewtwoY") {
          setTeamPoke(poke, rolTeam[pokemonSeleccionado]);
          pokemon.removeWhere((element) => element['name'] == rolTeam[pokemonSeleccionado]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoX');
        } else {
          setTeamPoke(poke, rolTeam[pokemonSeleccionado]);
          pokemon.removeWhere((element) => element['name'] == rolTeam[pokemonSeleccionado]['name']);
        }
      }
    });
  }

  void setEx() {
    setState(() {
      resetList();
      if(exs) {
        pokemon = pokemon.where((ex) => ex['type'] == 'normal').toList();
        exTag = "Sin Ex";
        exColor = Colors.green;
        exs = false;
      } else {
        resetList();
        exTag = "Con Ex";
        exColor = Colors.red;
        exs = true;
      }
    });
  }

  void setRol() {
    setState(() {
      setRolList();
      int rolSeleccionado = 1;
      if(allRol) {
        rolSeleccionado = randomizer.nextInt(rols.length);
        selectRol = rols[rolSeleccionado];
        rolTag = 'Rol: ${rols[rolSeleccionado]}';
        rolColor = setColor(rols[rolSeleccionado]);
        allRol = false;
      } else {
        selectRol = "Todos";
        rolTag = 'Rol: Todos';
        rolColor = Colors.lime;
        allRol = true;
      }
    });
  }

  void setPoke() {
    if(!exs && !allRol) {
      resetList();
      pokemon = pokemon.where((pokes) => pokes['type'] == 'normal' && pokes['rol'] == selectRol).toList();
    } else if(!exs && allRol) {
      resetList();
      pokemon = pokemon.where((pokes) => pokes['type'] == 'normal').toList();
    } else if(exs && !allRol) {
      resetList();
      pokemon = pokemon.where((pokes) => pokes['rol'] == selectRol).toList();
    } else {
      resetList();
    }
  }

  void setTeams(int pokemonSeleccionado, int counter) {
    if(pokemon[pokemonSeleccionado]['name'] == "MewtwoX") {
      setTeamPoke(counter, pokemon[pokemonSeleccionado]);
      pokemon.removeAt(pokemonSeleccionado);
      pokemon.removeWhere((element) => element['name'] == 'MewtwoY');
    } else if(pokemon[pokemonSeleccionado]['name'] == "MewtwoY") {
      setTeamPoke(counter, pokemon[pokemonSeleccionado]);
      pokemon.removeAt(pokemonSeleccionado);
      pokemon.removeWhere((element) => element['name'] == 'MewtwoX');
    } else {
      setTeamPoke(counter, pokemon[pokemonSeleccionado]);
      pokemon.removeAt(pokemonSeleccionado);
    }
  }

  void setTeamPoke(int counter, Map<String, dynamic> pokemon) {
    teams[counter]['name'] = pokemon['name'];
    teams[counter]['color'] = setColor(pokemon['rol']);
    teams[counter]['image'] = pokemon['image'];
  }

  Color setColor(String rol) {
    Color color = Colors.white;
    switch(rol) {
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
    }
    return color;
  }

  Future<void> goTwitch() async {
    if (!await launchUrl(_url)) {
      throw Exception('No es posible abrir el enlace $_url');
    }
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Tooltip (
              message: 'Habilita/Deshabilita los Pokémon con marca EX',
              child: OutlinedButton (
                onPressed: setEx,
                style: OutlinedButton.styleFrom(backgroundColor: exColor, side: const BorderSide(width: 3)),
                child: Text(exTag,
                style: const TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip (
              message: 'Define el rol de los Pokémon que usaran ambos equipos',
              child: OutlinedButton (
                onPressed: setRol,
                style: OutlinedButton.styleFrom(backgroundColor: rolColor, side: const BorderSide(width: 3)),
                child: Text(rolTag,
                style: const TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),

        // Primera fila de imágenes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: teams.sublist(0, 5).map((team) {
            return _buildImagenConTexto(team);
          }).toList(),
        ),
        const SizedBox(height: 20), // Separación entre las filas
        // Segunda fila de imágenes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: teams.sublist(5, 10).map((team) {
            return _buildImagenConTexto(team);
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Tooltip(
              message: 'Genera los equipos con cualquier Pokémon disponible',
              child: OutlinedButton(
                onPressed: random,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3)),
                child: const Text('Generar Equipos',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip(
              message: 'Genera los equipos sin repetir Pokémon de un equipo a otro',
              child: OutlinedButton (
                onPressed: (selectRol == 'Auxiliar' || selectRol == 'Agil') ? null : randomNoRepeat,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('Sin repetir',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip(
              message: 'Genera los equipos con un Pokémon de cada rol en cada equipo',
              child: OutlinedButton (
                onPressed: allRol ? fullteam : null,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('Balanceado',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip(
              message: 'Genera cada equipo con solo un rol, puede variar el rol de un equipo a otro',
              child: OutlinedButton (
                onPressed: allRol ? distinctRol : null,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('RolA vs RolB',
                style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            IconButton(
              onPressed: goTwitch,
              icon: const FaIcon(FontAwesomeIcons.twitch),
              iconSize: 20,
              style: IconButton.styleFrom(fixedSize: const Size(60, 34),backgroundColor: Colors.purpleAccent, side: const BorderSide(width: 1)),
              tooltip: 'Rphisto en Twitch',
            ),
          ],
        )
      ],
    );
  }

  Widget _buildImagenConTexto(Map<String, dynamic> teamData) {
    return Column (
      children: <Widget> [
        Container(
          width: 300,
          height: 300,
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration (
            color: teamData['color'],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset (
            teamData['image'],
            fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '${teamData['name']}',
          style: const TextStyle(fontSize: 30, color: Colors.yellow),
        ),
      ],
    );
  }
}
