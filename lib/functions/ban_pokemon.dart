import 'package:pokehomy/data/generic_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokehomy/models/pokemon.dart';

void banPokemon(Poke pokemon) async {
  await FirebaseFirestore.instance.collection('pokemon').doc(pokemon.id).update({'poke_available': !pokemon.estatus});
  currentBanStatus = pokemon.estatus ? disbanButtonTag : banButtonTag;
  currentBanButtonColor = pokemon.estatus ? disbanButtonColor : banButtonColor;
}