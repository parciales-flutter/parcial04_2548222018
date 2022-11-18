import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:actividadactividadparcial4/colores/colores.dart';

class reservas extends StatefulWidget {
  const reservas({super.key});

  @override
  _reservasState createState() => _reservasState();
}

class _reservasState extends State<reservas> {
  final CollectionReference _reservas =
  FirebaseFirestore.instance.collection('reservas');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        backgroundColor: color1,
        title: const Center(
          child: Text(
              'Todas las reservas'
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _reservas.snapshots(),
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
                        Text("Id: ${documentSnapshot['idReservas']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
                        Text("Estado de la reserva: ${documentSnapshot['estado']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
                        Text("Numero de vuelo asignado: ${documentSnapshot['vuelo']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
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