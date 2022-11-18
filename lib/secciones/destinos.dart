import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:actividadactividadparcial4/colores/colores.dart';

class destinos extends StatefulWidget {
  const destinos({super.key});

  @override
  _destinosState createState() => _destinosState();
}

class _destinosState extends State<destinos> {
  final CollectionReference _destinos =
  FirebaseFirestore.instance.collection('destinos');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        backgroundColor: color1,
        title: const Center(
          child: Text(
              'Destinos'
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _destinos.snapshots(),
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
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Id: ${documentSnapshot['id_destino']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
                        Text("Nombre: ${documentSnapshot['nombre']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
                        Text("Numero del horario: ${documentSnapshot['horario']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
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