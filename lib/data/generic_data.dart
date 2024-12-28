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

var legendaryTag = "Con Legendarios";
var legendaryTagTrue = "Con Legendarios";
var legendaryTagFalse = "Sin Legendarios";
var legendaries = false;

var eeveeTag = "Eevee: No";
var eeveeTagTrue = "Eevee: Si";
var eeveeTagFalse = "Eevee: No";
var eevees = false;

var roleTag = "Rol: Todos";
var selectRole = "Todos";
var allRole = true;

var teamPurpleTag = "";
var teamOrangeTag = "";

var currentBanStatus = "Banear";
var banButtonTag = "Banear";
var disbanButtonTag = "Desbanear";

const vsTag = "VS";

Color roleColor = Colors.lime;
Color exColor = Colors.red;
Color eeveeColor = Colors.red;

Color currentBanButtonColor = Colors.red;
Color banButtonColor = Colors.red;
Color disbanButtonColor = Colors.green;
