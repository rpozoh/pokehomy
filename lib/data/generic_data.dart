import 'package:flutter/material.dart';
import 'dart:math';
import 'package:pokehomy/data/pokemon_team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokehomy/models/pokemon.dart';

final randomizer = Random();
Future<List<Map<String, dynamic>>> pokemonListSnapshot() async {
  final pokemonSnapshot = await FirebaseFirestore.instance.collection('pokemon').get();
  return pokemonSnapshot.docs.map((doc) => doc.data()).toList();
}
Future<List<Map<String, dynamic>>> roleListSnapshot() async {
  final roleSnapshot = await FirebaseFirestore.instance.collection('roles').get();
  return roleSnapshot.docs.map((doc) => doc.data()).toList();
}
Future<List<Map<String, dynamic>>> typeListSnapshot() async {
  final typeSnapshot = await FirebaseFirestore.instance.collection('types').get();
  return typeSnapshot.docs.map((doc) => doc.data()).toList();
}

Future updatePoke() async {
  final pokeUpdateSnapshot = await FirebaseFirestore.instance.collection('pokemon').orderBy('poke_name').get();
  final pokeUpdate = pokeUpdateSnapshot.docs.map((doc) => Poke.fromSnapshot(doc)).toList();
  return pokeUpdate;
}

var pokemonTeam = team;

var legendaryTag = "Con Legendarios";
var legendaryTagTrue = "Con Legendarios";
var legendaryTagFalse = "Sin Legendarios";
var legendaries = true;

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

List<Color> tooltipColor = [Colors.lightBlue, Colors.deepOrange];
