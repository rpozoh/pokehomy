import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pokehomy/UI/ban_pokemon.dart';
import 'package:pokehomy/data/generic_data.dart';
import 'package:pokehomy/functions/generate_full_team.dart';
import 'package:pokehomy/functions/random_team.dart';
import 'package:pokehomy/functions/generate_no_repeat_team.dart';
import 'package:pokehomy/functions/generate_distinct_rol_team.dart';
import 'package:pokehomy/functions/generate_same_type_team.dart';
import 'package:pokehomy/functions/generics.dart';

class Randomizer extends StatefulWidget {
  const Randomizer({super.key});

  @override
  State<Randomizer> createState() {
    return _RandomizerState();
  }
}

class _RandomizerState extends State<Randomizer> {

  final Uri _url = Uri.parse('https://www.twitch.tv/rphisto');

  void random() {
    setState(() {
      generateRandomTeam();
    });
  }

  void randomNoRepeat() {
    setState(() {
      generateRandomNoRepeat();
    });
  }

  void fullteam() {
    setState(() {
      generateFullteam();
    });
  }

  void distinctRol() {
    setState(() {
      generateDistinctRolTeam();
    });
  }

  void sameTypeTeam() {
    setState(() {
      generateSameTypeTeam();
    });
  }

  void reOrder() {
    setState(() {
      reOrderTeams();
    });
  }

  void setLegends() {
    setState(() {
      setLegendaryPokemon();
    });
  }

  void setEevees() {
    setState(() {
      setEeveeTeam();
    });
  }

  void setRol() {
    setState(() {
      setTeamRol();
    });
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
              message: 'Habilita/Deshabilita los Pokémon legendarios',
              child: OutlinedButton (
                onPressed: setLegends,
                style: OutlinedButton.styleFrom(backgroundColor: exColor, side: const BorderSide(width: 3)),
                child: Text(legendaryTag,
                style: const TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip (
              message: 'Genera equipo solo de Eevolutions',
              child: OutlinedButton (
                onPressed: allRole ? setEevees : null,
                style: OutlinedButton.styleFrom(backgroundColor: eeveeColor, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: Text(eeveeTag,
                style: const TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip (
              message: 'Reordena los equipos con los Pokémon en pantalla',
              child: OutlinedButton (
                onPressed: allRole ? reOrder : null,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('Desordenar',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip (
              message: 'Define el rol de los Pokémon que usaran ambos equipos',
              child: OutlinedButton (
                onPressed: !eevees ? setRol: null,
                style: OutlinedButton.styleFrom(backgroundColor: roleColor, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: Text(roleTag,
                style: const TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),

        // Primera fila de imágenes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: pokemonTeam.sublist(0, 5).map((team) {
            return _buildImageWithText(team.team);
          }).toList(),
        ),
        Stack(
          children: <Widget>[
            Text(
              teamPurpleTag,
              style: TextStyle(
                fontSize: 20,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 5
                  ..color = Colors.black,
              ),
            ),
            Text(
              teamPurpleTag,
              style: TextStyle(
                fontSize: 20,
                shadows: const [Shadow(offset: Offset(2, 2), color: Colors.black)],
                color: setColor(teamPurpleTag)
              )
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            Text(
              vsTag,
              style: TextStyle(
                fontSize: 20,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 5
                  ..color = Colors.black,
              ),
            ),
            const Text(
              vsTag,
              style: TextStyle(
                fontSize: 20,
                color: Colors.yellow
              )
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            Text(
              teamOrangeTag,
              style: TextStyle(
                fontSize: 20,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 5
                  ..color = Colors.black,
              ),
            ),
              Text(
                teamOrangeTag,
                style: TextStyle(
                  fontSize: 20,
                  shadows: const [Shadow(offset: Offset(2, 2), color: Colors.black)],
                  color: setColor(teamOrangeTag)
                )
              ),
            ],
        ),
        // Segunda fila de imágenes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: pokemonTeam.sublist(5, 10).map((team) {
            return _buildImageWithText(team.team);
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
                onPressed: (selectRole == 'Auxiliar' || selectRole == 'Agil' || eevees) ? null : randomNoRepeat,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('Sin repetir',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip(
              message: 'Genera los equipos con un Pokémon de cada rol en cada equipo',
              child: OutlinedButton (
                onPressed: (allRole && !eevees) ? fullteam : null,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('Balanceado',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip(
              message: 'Genera cada equipo con solo un rol, puede variar el rol de un equipo a otro',
              child: OutlinedButton (
                onPressed: (allRole && !eevees) ? distinctRol : null,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue, side: const BorderSide(width: 3), disabledBackgroundColor: Colors.grey),
                child: const Text('RolA vs RolB',
                style: TextStyle(color: Colors.black)),
              ),
            ),
            Tooltip(
              message: 'Genera cada equipo con Pokémon que tengan el mismo tipo',
              child: OutlinedButton (
                onPressed: (allRole && !eevees) ? sameTypeTeam : null,
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
            Tooltip(
              message: 'Permite administrar la lista de baneados',
              child: OutlinedButton (
                onPressed: () => showPokemonBanListModal(context),
                style: OutlinedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(width: 3)),
                child: const Text('Baneos',
                style: TextStyle(color: Colors.black)),
              ),
            ),
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

  Widget _buildImageWithText(var teamData) {
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
        Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              '${teamData['name']}',
              style: TextStyle(
                fontSize: 30,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 8
                  ..color = const Color(0xff3c5aa6),
              ),
            ),
            // Solid text as fill.
            Text(
              '${teamData['name']}',
              style: const TextStyle(
                fontSize: 30,
                color: Color(0xffffcb05),
              ),
            ),
          ],
        )
      ],
    );
  }
}
