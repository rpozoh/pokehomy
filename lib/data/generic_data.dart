import 'package:flutter/material.dart';
import 'dart:math';
import 'package:pokehomy/data/pokemon_list.dart';
import 'package:pokehomy/data/pokemon_team.dart';
import 'package:pokehomy/data/pokemon_role.dart';
import 'package:pokehomy/data/pokemon_type.dart';

final randomizer = Random();
var pokemonList = pokemon;
var pokemonTeam = team;
var roleList = role;
var typeList = type;

var exTag = "Con Ex";
var exs = true;

var roleTag = "Rol: Todos";
var selectRole = "Todos";
var allRole = true;

var teamPurpleTag = "";
var teamOrangeTag = "";

const vsTag = "VS";

Color roleColor = Colors.lime;
Color exColor = Colors.red;
