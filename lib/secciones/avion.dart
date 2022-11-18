import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:actividadactividadparcial4/colores/colores.dart';

class avion extends StatefulWidget {
  const avion({super.key});

  @override
  _avionState createState() => _avionState();
}

class _avionState extends State<avion> {

  final CollectionReference _avion =
  FirebaseFirestore.instance.collection('avion');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        backgroundColor: color1,
        title: const Center(
          child: Text(
              'Todos los aviones'
          ),
        ),
      ),

      body: StreamBuilder(
        stream: _avion.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  color: color1,
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(documentSnapshot['codigo'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                        const SizedBox(width: 10),
                        Text(documentSnapshot['estado'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                        const SizedBox(width: 10),
                        Text(documentSnapshot['marca'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
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