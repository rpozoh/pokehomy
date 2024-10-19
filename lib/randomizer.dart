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

  var teamPurpleTag = "";
  var teamOrangeTag = "";

  var vsTag = "VS";

  Color rolColor = Colors.lime;
  Color exColor = Colors.red;

  final Uri _url = Uri.parse('https://www.twitch.tv/rphisto');

  void resetList() {
    pokemon = [
      {"name":"Absol", "rol":"Agil", "rarity":"normal", "type1":"Siniestro", "type2":"none", "image":"assets/images/absol.png"},
      {"name":"Aegislash", "rol":"Equilibrado", "rarity":"normal", "type1":"Acero", "type2":"Fantasma", "image":"assets/images/aegislash.png"},
      {"name":"Alolan-ninetales", "rol":"Ofensivo", "rarity":"normal", "type1":"Hielo", "type2":"Hada", "image":"assets/images/alolan-ninetales.png"},
      {"name":"Armarouge", "rol":"Ofensivo", "rarity":"normal", "type1":"Fuego", "type2":"Psíquico", "image":"assets/images/armarouge.png"},
      {"name":"Azumarill", "rol":"Equilibrado", "rarity":"normal", "type1":"Agua", "type2":"Hada", "image":"assets/images/azumarill.png"},
      {"name":"Blastoise", "rol":"Defensivo", "rarity":"normal", "type1":"Agua", "type2":"none", "image":"assets/images/blastoise.png"},
      {"name":"Blaziken", "rol":"Equilibrado", "rarity":"normal", "type1":"Fuego", "type2":"Lucha", "image":"assets/images/blaziken.png"},
      {"name":"Blissey", "rol":"Auxiliar", "rarity":"normal", "type1":"Normal", "type2":"none", "image":"assets/images/blissey.png"},
      {"name":"Buzzwole", "rol":"Equilibrado", "rarity":"normal", "type1":"Bicho", "type2":"Lucha", "image":"assets/images/buzzwole.png"},
      {"name":"Ceruledge", "rol":"Equilibrado", "rarity":"normal", "type1":"Fuego", "type2":"Fantasma", "image":"assets/images/ceruledge.png"},
      {"name":"Chandelure", "rol":"Ofensivo", "rarity":"normal", "type1":"Fantasma", "type2":"Fuego", "image":"assets/images/chandelure.png"},
      {"name":"Charizard", "rol":"Equilibrado", "rarity":"normal", "type1":"Fuego", "type2":"Volador", "image":"assets/images/charizard.png"},
      {"name":"Cinderace", "rol":"Ofensivo", "rarity":"normal", "type1":"Fuego", "type2":"none", "image":"assets/images/cinderace.png"},
      {"name":"Clefable", "rol":"Auxiliar", "rarity":"normal", "type1":"Hada", "type2":"none", "image":"assets/images/clefable.png"},
      {"name":"Comfey", "rol":"Auxiliar", "rarity":"normal", "type1":"Hada", "type2":"none", "image":"assets/images/comfey.png"},
      {"name":"Cramorant", "rol":"Ofensivo", "rarity":"normal", "type1":"Volador", "type2":"Agua", "image":"assets/images/cramorant.png"},
      {"name":"Crustle", "rol":"Defensivo", "rarity":"normal", "type1":"Bicho", "type2":"Roca", "image":"assets/images/crustle.png"},
      {"name":"Darkrai", "rol":"Agil", "rarity":"normal", "type1":"Siniestro", "type2":"none", "image":"assets/images/darkrai.png"},
      {"name":"Decidueye", "rol":"Ofensivo", "rarity":"normal", "type1":"Planta", "type2":"Fantasma", "image":"assets/images/decidueye.png"},
      {"name":"Delphox", "rol":"Ofensivo", "rarity":"normal", "type1":"Fuego", "type2":"Psíquico", "image":"assets/images/delphox.png"},
      {"name":"Dodrio", "rol":"Agil", "rarity":"normal", "type1":"Normal", "type2":"Volador", "image":"assets/images/dodrio.png"},
      {"name":"Dragapult", "rol":"Ofensivo", "rarity":"normal", "type1":"Dragon", "type2":"Fantasma", "image":"assets/images/dragapult.png"},
      {"name":"Dragonite", "rol":"Equilibrado", "rarity":"normal", "type1":"Dragon", "type2":"Volador", "image":"assets/images/dragonite.png"},
      {"name":"Duraludon", "rol":"Ofensivo", "rarity":"normal", "type1":"Acero", "type2":"Dragon", "image":"assets/images/duraludon.png"},
      {"name":"Eldegoss", "rol":"Auxiliar", "rarity":"normal", "type1":"Planta", "type2":"none", "image":"assets/images/eldegoss.png"},
      {"name":"Espeon", "rol":"Ofensivo", "rarity":"normal", "type1":"Psíquico", "type2":"none", "image":"assets/images/espeon.png"},
      {"name":"Falinks", "rol":"Equilibrado", "rarity":"normal", "type1":"Lucha", "type2":"none", "image":"assets/images/falinks.png"},
      {"name":"Garchomp", "rol":"Equilibrado", "rarity":"normal", "type1":"Dragon", "type2":"Tierra", "image":"assets/images/garchomp.png"},
      {"name":"Gardevoir", "rol":"Ofensivo", "rarity":"normal", "type1":"Psíquico", "type2":"Hada", "image":"assets/images/gardevoir.png"},
      {"name":"Gengar", "rol":"Agil", "rarity":"normal", "type1":"Fantasma", "type2":"Veneno", "image":"assets/images/gengar.png"},
      {"name":"Glaceon", "rol":"Ofensivo", "rarity":"normal", "type1":"Hielo", "type2":"none", "image":"assets/images/glaceon.png"},
      {"name":"Goodra", "rol":"Defensivo", "rarity":"normal", "type1":"Dragon", "type2":"none", "image":"assets/images/goodra.png"},
      {"name":"Greedent", "rol":"Defensivo", "rarity":"normal", "type1":"Normal", "type2":"none", "image":"assets/images/greedent.png"},
      {"name":"Greninja", "rol":"Ofensivo", "rarity":"normal", "type1":"Agua", "type2":"Siniestro", "image":"assets/images/greninja.png"},
      {"name":"Gyarados", "rol":"Equilibrado", "rarity":"normal", "type1":"Agua", "type2":"Volador", "image":"assets/images/gyarados.png"},
      {"name":"Ho-Oh", "rol":"Defensivo", "rarity":"ex", "type1":"Fuego", "type2":"Volador", "image":"assets/images/ho-oh.png"},
      {"name":"Hoopa", "rol":"Auxiliar", "rarity":"normal", "type1":"Psíquico", "type2":"Fantasma/Siniestro", "image":"assets/images/hoopa.png"},
      {"name":"Inteleon", "rol":"Ofensivo", "rarity":"normal", "type1":"Agua", "type2":"none", "image":"assets/images/inteleon.png"},
      {"name":"Lapras", "rol":"Defensivo", "rarity":"normal", "type1":"Agua", "type2":"Hielo", "image":"assets/images/lapras.png"},
      {"name":"Leafeon", "rol":"Agil", "rarity":"normal", "type1":"Planta", "type2":"none", "image":"assets/images/leafeon.png"},
      {"name":"Lucario", "rol":"Equilibrado", "rarity":"normal", "type1":"Lucha", "type2":"Acero", "image":"assets/images/lucario.png"},
      {"name":"Machamp", "rol":"Equilibrado", "rarity":"normal", "type1":"Lucha", "type2":"none", "image":"assets/images/machamp.png"},
      {"name":"Mamoswine", "rol":"Defensivo", "rarity":"normal", "type1":"Hielo", "type2":"Tierra", "image":"assets/images/mamoswine.png"},
      {"name":"Meowscarada", "rol":"Agil", "rarity":"normal", "type1":"Planta", "type2":"Siniestro", "image":"assets/images/meowscarada.png"},
      {"name":"Metagross", "rol":"Equilibrado", "rarity":"normal", "type1":"Acero", "type2":"Psíquico", "image":"assets/images/metagross.png"},
      {"name":"Mew", "rol":"Ofensivo", "rarity":"normal", "type1":"Psíquico", "type2":"none", "image":"assets/images/mew.png"},
      {"name":"MewtwoX", "rol":"Equilibrado", "rarity":"ex", "type1":"Psíquico", "type2":"Lucha", "image":"assets/images/mewtwoX.png"},
      {"name":"MewtwoY", "rol":"Ofensivo", "rarity":"ex", "type1":"Psíquico", "type2":"none", "image":"assets/images/mewtwoY.png"},
      {"name":"Mimikyu", "rol":"Equilibrado", "rarity":"normal", "type1":"Fantasma", "type2":"Hada", "image":"assets/images/mimikyu.png"},
      {"name":"Miraidon", "rol":"Ofensivo", "rarity":"ex", "type1":"Electrico", "type2":"Dragon", "image":"assets/images/miraidon.png"},
      {"name":"Mr.mime", "rol":"Auxiliar", "rarity":"normal", "type1":"Psíquico", "type2":"Hada", "image":"assets/images/mr-mime.png"},
      {"name":"Pikachu", "rol":"Ofensivo", "rarity":"normal", "type1":"Electrico", "type2":"none", "image":"assets/images/pikachu.png"},
      {"name":"Sableye", "rol":"Auxiliar", "rarity":"normal", "type1":"Siniestro", "type2":"Fantasma", "image":"assets/images/sableye.png"},
      {"name":"Scizor", "rol":"Equilibrado", "rarity":"normal", "type1":"Bicho", "type2":"Volador/Acero", "image":"assets/images/scizor.png"},
      {"name":"Slowbro", "rol":"Defensivo", "rarity":"normal", "type1":"Agua", "type2":"Psíquico", "image":"assets/images/slowbro.png"},
      {"name":"Snorlax", "rol":"Defensivo", "rarity":"normal", "type1":"Normal", "type2":"none", "image":"assets/images/snorlax.png"},
      {"name":"Sylveon", "rol":"Ofensivo", "rarity":"normal", "type1":"Hada", "type2":"none", "image":"assets/images/sylveon.png"},
      {"name":"Talonflame", "rol":"Agil", "rarity":"normal", "type1":"Fuego", "type2":"Volador", "image":"assets/images/talonflame.png"},
      {"name":"Trevenant", "rol":"Defensivo", "rarity":"normal", "type1":"Fantasma", "type2":"Planta", "image":"assets/images/trevenant.png"},
      {"name":"Tsareena", "rol":"Equilibrado", "rarity":"normal", "type1":"Planta", "type2":"none", "image":"assets/images/tsareena.png"},
      {"name":"Tyranitar", "rol":"Equilibrado", "rarity":"normal", "type1":"Roca", "type2":"Siniestro", "image":"assets/images/tyranitar.png"},
      {"name":"Umbreon", "rol":"Defensivo", "rarity":"normal", "type1":"Siniestro", "type2":"none", "image":"assets/images/umbreon.png"},
      {"name":"Urshifu", "rol":"Equilibrado", "rarity":"normal", "type1":"Lucha", "type2":"Siniestro/Agua", "image":"assets/images/urshifu.png"},
      {"name":"Venusaur", "rol":"Ofensivo", "rarity":"normal", "type1":"Planta", "type2":"Veneno", "image":"assets/images/venusaur.png"},
      {"name":"Wigglytuff", "rol":"Auxiliar", "rarity":"normal", "type1":"Normal", "type2":"Hada", "image":"assets/images/wigglytuff.png"},
      {"name":"Zacian", "rol":"Equilibrado", "rarity":"ex", "type1":"Hada", "type2":"Acero", "image":"assets/images/zacian.png"},
      {"name":"Zeraora", "rol":"Agil", "rarity":"normal", "type1":"Electrico", "type2":"none", "image":"assets/images/zeraora.png"},
      {"name":"Zoroark", "rol":"Agil", "rarity":"normal", "type1":"Siniestro", "type2":"none", "image":"assets/images/zoroark.png"}
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

  void setTypeList() {
    rols = [
      "Siniestro",
      "Acero",
      "Fantasma",
      "Hada",
      "Fuego",
      "Psíquico",
      "Agua",
      "Lucha",
      "Volador",
      "Planta",
      "Dragon",
      "Tierra",
      "Normal",
      //"Hielo",
      //"Roca",
      //"Electrico",
      //"Veneno",
      //"Bicho"
    ];
  }

  void random() {
    setState(() {
      int counter = 0;
      int pokemonSeleccionado = 1;
      setPoke();
      setRolList();
      setRolTagTeam(true, "");
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
      setRolTagTeam(true, "");
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
      setRolTagTeam(true, "");
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
      setRolTagTeam(false, "");
      for(var poke = 0; poke < 10; poke++) {
        if(poke == 0) {
          setPoke();
          rolSeleccionado = randomizer.nextInt(rols.length);
          teamPurpleTag = rols[rolSeleccionado];
        }
        if(poke == 5) {
          rolSeleccionado = randomizer.nextInt(rols.length);
          teamOrangeTag = rols[rolSeleccionado];
          setPoke();
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
        pokemon = pokemon.where((ex) => ex['rarity'] == 'normal').toList();
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
      pokemon = pokemon.where((pokes) => pokes['rarity'] == 'normal' && pokes['rol'] == selectRol).toList();
      setRolTagTeam(false, selectRol);
    } else if(!exs && allRol) {
      resetList();
      pokemon = pokemon.where((pokes) => pokes['rarity'] == 'normal').toList();
    } else if(exs && !allRol) {
      resetList();
      pokemon = pokemon.where((pokes) => pokes['rol'] == selectRol).toList();
      setRolTagTeam(false, selectRol);
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

  void setRolTagTeam(bool allRolTag, String rol) {
    if(!allRolTag) {
      teamPurpleTag = rol;
      teamOrangeTag = rol;
    } else {
      teamPurpleTag = "";
      teamOrangeTag = "";
    }

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
        Text(teamPurpleTag, style: TextStyle(fontSize: 20, shadows: const [Shadow(offset: Offset(2, 2), color: Colors.black)], color: setColor(teamPurpleTag))),
        Text(vsTag, style: const TextStyle(fontSize: 20, color: Colors.yellow)),
        Text(teamOrangeTag, style: TextStyle(fontSize: 20, shadows: const [Shadow(offset: Offset(2, 2), color: Colors.black)], color: setColor(teamOrangeTag))),
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
