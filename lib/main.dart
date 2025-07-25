import 'package:flutter/material.dart';

import 'package:pokehomy/gradient_container.dart';

import 'package:firebase_core/firebase_core.dart';

const firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyDxze1NxoHsYJ2fFmqramYx-Hwi4pBsCEA",
  authDomain: "flutter-randunite.firebaseapp.com",
  projectId: "flutter-randunite",
  storageBucket: "flutter-randunite.appspot.com",
  messagingSenderId: "607716932889",
  appId: "1:607716932889:web:b86bed476afccba307d988"
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(Alignment.topCenter, Alignment.bottomCenter, [Color.fromARGB(255, 43, 1, 116), Color.fromARGB(255, 247, 148, 1)]),
      ),
      title: 'Randomizer by Rphisto v7.0.2',
    ),
  );
}

