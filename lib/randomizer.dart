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

  List<String> role = [];

  List<String> types = [];

  var exTag = "Con Ex";
  var exs = true;

  var roleTag = "Rol: Todos";
  var selectRole = "Todos";
  var allRole = true;

  var teamPurpleTag = "";
  var teamOrangeTag = "";

  var vsTag = "VS";

  Color roleColor = Colors.lime;
  Color exColor = Colors.red;

  final Uri _url = Uri.parse('https://www.twitch.tv/rphisto');

  void resetList() {
    pokemon = [
      {"name":"Absol", "role":"Agil", "rarity":"normal", "type1":"Siniestro", "type2":"none", "image":"assets/images/absol.png"},
      {"name":"Aegislash", "role":"Equilibrado", "rarity":"normal", "type1":"Acero", "type2":"Fantasma", "image":"assets/images/aegislash.png"},
      {"name":"Alolan-ninetales", "role":"Ofensivo", "rarity":"normal", "type1":"Hielo", "type2":"Hada", "image":"assets/images/alolan-ninetales.png"},
      {"name":"Armarouge", "role":"Ofensivo", "rarity":"normal", "type1":"Fuego", "type2":"Psíquico", "image":"assets/images/armarouge.png"},
      {"name":"Azumarill", "role":"Equilibrado", "rarity":"normal", "type1":"Agua", "type2":"Hada", "image":"assets/images/azumarill.png"},
      {"name":"Blastoise", "role":"Defensivo", "rarity":"normal", "type1":"Agua", "type2":"none", "image":"assets/images/blastoise.png"},
      {"name":"Blaziken", "role":"Equilibrado", "rarity":"normal", "type1":"Fuego", "type2":"Lucha", "image":"assets/images/blaziken.png"},
      {"name":"Blissey", "role":"Auxiliar", "rarity":"normal", "type1":"Normal", "type2":"none", "image":"assets/images/blissey.png"},
      {"name":"Buzzwole", "role":"Equilibrado", "rarity":"normal", "type1":"Bicho", "type2":"Lucha", "image":"assets/images/buzzwole.png"},
      {"name":"Ceruledge", "role":"Equilibrado", "rarity":"normal", "type1":"Fuego", "type2":"Fantasma", "image":"assets/images/ceruledge.png"},
      {"name":"Chandelure", "role":"Ofensivo", "rarity":"normal", "type1":"Fantasma", "type2":"Fuego", "image":"assets/images/chandelure.png"},
      {"name":"Charizard", "role":"Equilibrado", "rarity":"normal", "type1":"Fuego", "type2":"Volador", "image":"assets/images/charizard.png"},
      {"name":"Cinderace", "role":"Ofensivo", "rarity":"normal", "type1":"Fuego", "type2":"none", "image":"assets/images/cinderace.png"},
      {"name":"Clefable", "role":"Auxiliar", "rarity":"normal", "type1":"Hada", "type2":"none", "image":"assets/images/clefable.png"},
      {"name":"Comfey", "role":"Auxiliar", "rarity":"normal", "type1":"Hada", "type2":"none", "image":"assets/images/comfey.png"},
      {"name":"Cramorant", "role":"Ofensivo", "rarity":"normal", "type1":"Volador", "type2":"Agua", "image":"assets/images/cramorant.png"},
      {"name":"Crustle", "role":"Defensivo", "rarity":"normal", "type1":"Bicho", "type2":"Roca", "image":"assets/images/crustle.png"},
      {"name":"Darkrai", "role":"Agil", "rarity":"normal", "type1":"Siniestro", "type2":"none", "image":"assets/images/darkrai.png"},
      {"name":"Decidueye", "role":"Ofensivo", "rarity":"normal", "type1":"Planta", "type2":"Fantasma", "image":"assets/images/decidueye.png"},
      {"name":"Delphox", "role":"Ofensivo", "rarity":"normal", "type1":"Fuego", "type2":"Psíquico", "image":"assets/images/delphox.png"},
      {"name":"Dodrio", "role":"Agil", "rarity":"normal", "type1":"Normal", "type2":"Volador", "image":"assets/images/dodrio.png"},
      {"name":"Dragapult", "role":"Ofensivo", "rarity":"normal", "type1":"Dragon", "type2":"Fantasma", "image":"assets/images/dragapult.png"},
      {"name":"Dragonite", "role":"Equilibrado", "rarity":"normal", "type1":"Dragon", "type2":"Volador", "image":"assets/images/dragonite.png"},
      {"name":"Duraludon", "role":"Ofensivo", "rarity":"normal", "type1":"Acero", "type2":"Dragon", "image":"assets/images/duraludon.png"},
      {"name":"Eldegoss", "role":"Auxiliar", "rarity":"normal", "type1":"Planta", "type2":"none", "image":"assets/images/eldegoss.png"},
      {"name":"Espeon", "role":"Ofensivo", "rarity":"normal", "type1":"Psíquico", "type2":"none", "image":"assets/images/espeon.png"},
      {"name":"Falinks", "role":"Equilibrado", "rarity":"normal", "type1":"Lucha", "type2":"none", "image":"assets/images/falinks.png"},
      {"name":"Garchomp", "role":"Equilibrado", "rarity":"normal", "type1":"Dragon", "type2":"Tierra", "image":"assets/images/garchomp.png"},
      {"name":"Gardevoir", "role":"Ofensivo", "rarity":"normal", "type1":"Psíquico", "type2":"Hada", "image":"assets/images/gardevoir.png"},
      {"name":"Gengar", "role":"Agil", "rarity":"normal", "type1":"Fantasma", "type2":"Veneno", "image":"assets/images/gengar.png"},
      {"name":"Glaceon", "role":"Ofensivo", "rarity":"normal", "type1":"Hielo", "type2":"none", "image":"assets/images/glaceon.png"},
      {"name":"Goodra", "role":"Defensivo", "rarity":"normal", "type1":"Dragon", "type2":"none", "image":"assets/images/goodra.png"},
      {"name":"Greedent", "role":"Defensivo", "rarity":"normal", "type1":"Normal", "type2":"none", "image":"assets/images/greedent.png"},
      {"name":"Greninja", "role":"Ofensivo", "rarity":"normal", "type1":"Agua", "type2":"Siniestro", "image":"assets/images/greninja.png"},
      {"name":"Gyarados", "role":"Equilibrado", "rarity":"normal", "type1":"Agua", "type2":"Volador", "image":"assets/images/gyarados.png"},
      {"name":"Ho-Oh", "role":"Defensivo", "rarity":"ex", "type1":"Fuego", "type2":"Volador", "image":"assets/images/ho-oh.png"},
      {"name":"Hoopa", "role":"Auxiliar", "rarity":"normal", "type1":"Psíquico", "type2":"Fantasma/Siniestro", "image":"assets/images/hoopa.png"},
      {"name":"Inteleon", "role":"Ofensivo", "rarity":"normal", "type1":"Agua", "type2":"none", "image":"assets/images/inteleon.png"},
      {"name":"Lapras", "role":"Defensivo", "rarity":"normal", "type1":"Agua", "type2":"Hielo", "image":"assets/images/lapras.png"},
      {"name":"Leafeon", "role":"Agil", "rarity":"normal", "type1":"Planta", "type2":"none", "image":"assets/images/leafeon.png"},
      {"name":"Lucario", "role":"Equilibrado", "rarity":"normal", "type1":"Lucha", "type2":"Acero", "image":"assets/images/lucario.png"},
      {"name":"Machamp", "role":"Equilibrado", "rarity":"normal", "type1":"Lucha", "type2":"none", "image":"assets/images/machamp.png"},
      {"name":"Mamoswine", "role":"Defensivo", "rarity":"normal", "type1":"Hielo", "type2":"Tierra", "image":"assets/images/mamoswine.png"},
      {"name":"Meowscarada", "role":"Agil", "rarity":"normal", "type1":"Planta", "type2":"Siniestro", "image":"assets/images/meowscarada.png"},
      {"name":"Metagross", "role":"Equilibrado", "rarity":"normal", "type1":"Acero", "type2":"Psíquico", "image":"assets/images/metagross.png"},
      {"name":"Mew", "role":"Ofensivo", "rarity":"normal", "type1":"Psíquico", "type2":"none", "image":"assets/images/mew.png"},
      {"name":"MewtwoX", "role":"Equilibrado", "rarity":"ex", "type1":"Psíquico", "type2":"Lucha", "image":"assets/images/mewtwoX.png"},
      {"name":"MewtwoY", "role":"Ofensivo", "rarity":"ex", "type1":"Psíquico", "type2":"none", "image":"assets/images/mewtwoY.png"},
      {"name":"Mimikyu", "role":"Equilibrado", "rarity":"normal", "type1":"Fantasma", "type2":"Hada", "image":"assets/images/mimikyu.png"},
      {"name":"Miraidon", "role":"Ofensivo", "rarity":"ex", "type1":"Electrico", "type2":"Dragon", "image":"assets/images/miraidon.png"},
      {"name":"Mr.mime", "role":"Auxiliar", "rarity":"normal", "type1":"Psíquico", "type2":"Hada", "image":"assets/images/mr-mime.png"},
      {"name":"Pikachu", "role":"Ofensivo", "rarity":"normal", "type1":"Electrico", "type2":"none", "image":"assets/images/pikachu.png"},
      {"name":"Sableye", "role":"Auxiliar", "rarity":"normal", "type1":"Siniestro", "type2":"Fantasma", "image":"assets/images/sableye.png"},
      {"name":"Scizor", "role":"Equilibrado", "rarity":"normal", "type1":"Bicho", "type2":"Volador/Acero", "image":"assets/images/scizor.png"},
      {"name":"Slowbro", "role":"Defensivo", "rarity":"normal", "type1":"Agua", "type2":"Psíquico", "image":"assets/images/slowbro.png"},
      {"name":"Snorlax", "role":"Defensivo", "rarity":"normal", "type1":"Normal", "type2":"none", "image":"assets/images/snorlax.png"},
      {"name":"Sylveon", "role":"Ofensivo", "rarity":"normal", "type1":"Hada", "type2":"none", "image":"assets/images/sylveon.png"},
      {"name":"Talonflame", "role":"Agil", "rarity":"normal", "type1":"Fuego", "type2":"Volador", "image":"assets/images/talonflame.png"},
      {"name":"Trevenant", "role":"Defensivo", "rarity":"normal", "type1":"Fantasma", "type2":"Planta", "image":"assets/images/trevenant.png"},
      {"name":"Tsareena", "role":"Equilibrado", "rarity":"normal", "type1":"Planta", "type2":"none", "image":"assets/images/tsareena.png"},
      {"name":"Tyranitar", "role":"Equilibrado", "rarity":"normal", "type1":"Roca", "type2":"Siniestro", "image":"assets/images/tyranitar.png"},
      {"name":"Umbreon", "role":"Defensivo", "rarity":"normal", "type1":"Siniestro", "type2":"none", "image":"assets/images/umbreon.png"},
      {"name":"Urshifu", "role":"Equilibrado", "rarity":"normal", "type1":"Lucha", "type2":"Siniestro/Agua", "image":"assets/images/urshifu.png"},
      {"name":"Venusaur", "role":"Ofensivo", "rarity":"normal", "type1":"Planta", "type2":"Veneno", "image":"assets/images/venusaur.png"},
      {"name":"Wigglytuff", "role":"Auxiliar", "rarity":"normal", "type1":"Normal", "type2":"Hada", "image":"assets/images/wigglytuff.png"},
      {"name":"Zacian", "role":"Equilibrado", "rarity":"ex", "type1":"Hada", "type2":"Acero", "image":"assets/images/zacian.png"},
      {"name":"Zeraora", "role":"Agil", "rarity":"normal", "type1":"Electrico", "type2":"none", "image":"assets/images/zeraora.png"},
      {"name":"Zoroark", "role":"Agil", "rarity":"normal", "type1":"Siniestro", "type2":"none", "image":"assets/images/zoroark.png"}
    ];
  }

  void setRoleList() {
    role = [
      "Ofensivo",
      "Agil",
      "Equilibrado",
      "Defensivo",
      "Auxiliar"
    ];
  }

  void setTypeList() {
    types = [
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
      "Normal",
      //"Tierra",
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
      int pokemonSelected = 1;
      setPoke();
      setRoleList();
      setRoleTagTeam(true, "");
      for(var team = 1; team <= 2; team++) {
        for(var poke = 1; poke <= 5; poke++) {
          pokemonSelected = randomizer.nextInt(pokemon.length);
          setTeams(pokemonSelected, counter);
          counter++;
        }
        setPoke();
      }
    });
  }

  void randomNoRepeat() {
    setState(() {
      int pokemonSelected = 1;
      setPoke();
      setRoleList();
      setRoleTagTeam(true, "");
      for(var poke = 0; poke < 10; poke++) {
        pokemonSelected = randomizer.nextInt(pokemon.length);
        setTeams(pokemonSelected, poke);
      }
      setPoke();
    });
  }

  void fullteam() {
    setState(() {
      int pokemonSelected = 1;
      int roleSelected = 1;
      List<Map<String, dynamic>> fullTeam = [];
      setPoke();
      setRoleList();
      setRoleTagTeam(true, "");
      for(var poke = 0; poke < 10; poke++) {
        if(poke == 5) {
          setRoleList();
        }
        roleSelected = randomizer.nextInt(role.length);
        fullTeam = pokemon.where((pokes) => pokes['role'] == role[roleSelected]).toList();
        pokemonSelected = randomizer.nextInt(fullTeam.length);
        if(fullTeam[pokemonSelected]['name'] == "MewtwoX") {
          setTeamPoke(poke, fullTeam[pokemonSelected]);
          pokemon.removeWhere((element) => element['name'] == fullTeam[pokemonSelected]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoY');
          role.removeAt(roleSelected);
        } else if(fullTeam[pokemonSelected]['name'] == "MewtwoY") {
          setTeamPoke(poke, fullTeam[pokemonSelected]);
          pokemon.removeWhere((element) => element['name'] == fullTeam[pokemonSelected]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoX');
          role.removeAt(roleSelected);
        } else {
          setTeamPoke(poke, fullTeam[pokemonSelected]);
          pokemon.removeWhere((element) => element['name'] == fullTeam[pokemonSelected]['name']);
          role.removeAt(roleSelected);
        }
      }
    });
  }

  void distinctRol() {
    setState(() {
      int pokemonSelected = 1;
      int roleSelected = 1;
      List<Map<String, dynamic>> roleTeam = [];
      setRoleList();
      setPoke();
      setRoleTagTeam(false, "");
      for(var poke = 0; poke < 10; poke++) {
        if(poke == 0) {
          setPoke();
          roleSelected = randomizer.nextInt(role.length);
          teamPurpleTag = role[roleSelected];
        }
        if(poke == 5) {
          roleSelected = randomizer.nextInt(role.length);
          teamOrangeTag = role[roleSelected];
          setPoke();
        }
        roleTeam = pokemon.where((pokes) => pokes['role'] == role[roleSelected]).toList();
        pokemonSelected = randomizer.nextInt(roleTeam.length);
        if(roleTeam[pokemonSelected]['name'] == "MewtwoX") {
          setTeamPoke(poke, roleTeam[pokemonSelected]);
          pokemon.removeWhere((element) => element['name'] == roleTeam[pokemonSelected]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoY');
        } else if(roleTeam[pokemonSelected]['name'] == "MewtwoY") {
          setTeamPoke(poke, roleTeam[pokemonSelected]);
          pokemon.removeWhere((element) => element['name'] == roleTeam[pokemonSelected]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoX');
        } else {
          setTeamPoke(poke, roleTeam[pokemonSelected]);
          pokemon.removeWhere((element) => element['name'] == roleTeam[pokemonSelected]['name']);
        }
      }
    });
  }

  void sameTypeTeam() {
    setState(() {
      int pokemonSelected = 1;
      int typeSelected = 1;
      List<Map<String, dynamic>> typeTeam = [];
      setTypeList();
      setPoke();
      setRoleTagTeam(false, "");
      for(var poke = 0; poke < 10; poke++) {
        if(poke == 0) {
          setPoke();
          typeSelected = randomizer.nextInt(types.length);
          teamPurpleTag = types[typeSelected];
        }
        if(poke == 5) {
          setPoke();
          typeSelected = randomizer.nextInt(types.length);
          teamOrangeTag = types[typeSelected];
        }
        typeTeam = pokemon.where((pokes) => pokes['type1'] == types[typeSelected] || pokes['type2'].contains(types[typeSelected])).toList();
        pokemonSelected = randomizer.nextInt(typeTeam.length);
        if(typeTeam[pokemonSelected]['name'] == "MewtwoX") {
          setTeamPoke(poke, typeTeam[pokemonSelected]);
          pokemon.removeWhere((element) => element['name'] == typeTeam[pokemonSelected]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoY');
        } else if(typeTeam[pokemonSelected]['name'] == "MewtwoY") {
          setTeamPoke(poke, typeTeam[pokemonSelected]);
          pokemon.removeWhere((element) => element['name'] == typeTeam[pokemonSelected]['name']);
          pokemon.removeWhere((element) => element['name'] == 'MewtwoX');
        } else {
          setTeamPoke(poke, typeTeam[pokemonSelected]);
          pokemon.removeWhere((element) => element['name'] == typeTeam[pokemonSelected]['name']);
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
      setRoleList();
      int roleSelected = 1;
      if(allRole) {
        roleSelected = randomizer.nextInt(role.length);
        selectRole = role[roleSelected];
        roleTag = 'Rol: ${role[roleSelected]}';
        roleColor = setColor(role[roleSelected]);
        allRole = false;
      } else {
        selectRole = "Todos";
        roleTag = 'Rol: Todos';
        roleColor = Colors.lime;
        allRole = true;
      }
    });
  }

  void setPoke() {
    if(!exs && !allRole) {
      resetList();
      pokemon = pokemon.where((pokes) => pokes['rarity'] == 'normal' && pokes['role'] == selectRole).toList();
      setRoleTagTeam(false, selectRole);
    } else if(!exs && allRole) {
      resetList();
      pokemon = pokemon.where((pokes) => pokes['rarity'] == 'normal').toList();
    } else if(exs && !allRole) {
      resetList();
      pokemon = pokemon.where((pokes) => pokes['role'] == selectRole).toList();
      setRoleTagTeam(false, selectRole);
    } else {
      resetList();
    }
  }

  void setTeams(int pokemonSelected, int counter) {
    if(pokemon[pokemonSelected]['name'] == "MewtwoX") {
      setTeamPoke(counter, pokemon[pokemonSelected]);
      pokemon.removeAt(pokemonSelected);
      pokemon.removeWhere((element) => element['name'] == 'MewtwoY');
    } else if(pokemon[pokemonSelected]['name'] == "MewtwoY") {
      setTeamPoke(counter, pokemon[pokemonSelected]);
      pokemon.removeAt(pokemonSelected);
      pokemon.removeWhere((element) => element['name'] == 'MewtwoX');
    } else {
      setTeamPoke(counter, pokemon[pokemonSelected]);
      pokemon.removeAt(pokemonSelected);
    }
  }

  void setTeamPoke(int counter, Map<String, dynamic> pokemon) {
    teams[counter]['name'] = pokemon['name'];
    teams[counter]['color'] = setColor(pokemon['role']);
    teams[counter]['image'] = pokemon['image'];
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
              message: 'Define el role de los Pokémon que usaran ambos equipos',
              child: OutlinedButton (
                onPressed: setRol,
                style: OutlinedButton.styleFrom(backgroundColor: roleColor, side: const BorderSide(width: 3)),
                child: Text(roleTag,
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
                onPressed: (selectRole == 'Auxiliar' || selectRole == 'Agil') ? null : randomNoRepeat,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('Sin repetir',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip(
              message: 'Genera los equipos con un Pokémon de cada role en cada equipo',
              child: OutlinedButton (
                onPressed: allRole ? fullteam : null,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('Balanceado',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip(
              message: 'Genera cada equipo con solo un role, puede variar el role de un equipo a otro',
              child: OutlinedButton (
                onPressed: allRole ? distinctRol : null,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('RolA vs RolB',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip(
              message: 'Genera cada equipo con Pokémon que tengan el mismo tipo',
              child: OutlinedButton (
                onPressed: allRole ? sameTypeTeam : null,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('Por tipo',
                style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
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
