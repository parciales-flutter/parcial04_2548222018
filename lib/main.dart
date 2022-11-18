import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'secciones/principal.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(home());
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicacion de vuelos',
      home: principal(),
    );
  }
}