import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:actividadactividadparcial4/colores/colores.dart';

class horarios extends StatefulWidget {
  const horarios({super.key});

  @override
  _horariosState createState() => _horariosState();
}

class _horariosState extends State<horarios> {
  final CollectionReference _horarios =
  FirebaseFirestore.instance.collection('horarios');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        backgroundColor: color1,
        title: const Center(
          child: Text(
              'Horarios de vuelos'
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _horarios.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  color: color2,
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(documentSnapshot['id_horario'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                        const SizedBox(width: 15),
                        Text(documentSnapshot['hora_vuelo'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}