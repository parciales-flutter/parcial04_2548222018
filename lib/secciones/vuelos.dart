import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:actividadactividadparcial4/colores/colores.dart';

class vuelos extends StatefulWidget {
  const vuelos({super.key});

  @override
  State<vuelos> createState() => _vuelosState();
}

class _vuelosState extends State<vuelos> {
  final TextEditingController _idVueloController = TextEditingController();
  final TextEditingController _tipo_vueloController = TextEditingController();
  final TextEditingController _avionController = TextEditingController();
  final TextEditingController _disponibilidadController = TextEditingController();

  final CollectionReference _vuelos =
  FirebaseFirestore.instance.collection('vuelos');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  controller: _idVueloController,
                  decoration: const InputDecoration(labelText: 'id del vuelo'),
                ),
                TextField(
                  controller: _tipo_vueloController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de vuelo',
                  ),
                ),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  controller: _avionController,
                  decoration: const InputDecoration(
                    labelText: 'Numero del avion',
                  ),
                ),
                TextField(
                  controller: _disponibilidadController,
                  decoration: const InputDecoration(
                    labelText: 'Disponibilidad',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () async {
                    final int? idVuelo = int.tryParse(_idVueloController.text);
                    final String tipo_vuelo = _tipo_vueloController.text;
                    final int? avion = int.tryParse(_avionController.text);
                    final String disponibilidad = _disponibilidadController.text;
                    if (idVuelo != null) {
                      await _vuelos
                          .add({"idVuelo": idVuelo, "tipo_vuelo": tipo_vuelo, "avion": avion, "disponibilidad": disponibilidad});
                      _idVueloController.text = '';
                      _tipo_vueloController.text = '';
                      _avionController.text = '';
                      _disponibilidadController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _idVueloController.text = documentSnapshot['idVuelo'].toString();
      _tipo_vueloController.text = documentSnapshot['tipo_vuelo'].toString();
      _avionController.text = documentSnapshot['avion'].toString();
      _disponibilidadController.text = documentSnapshot['disponibilidad'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  controller: _idVueloController,
                  decoration: const InputDecoration(labelText: 'id del vuelo'),
                ),
                TextField(
                  controller: _tipo_vueloController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de vuelo',
                  ),
                ),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  controller: _avionController,
                  decoration: const InputDecoration(
                    labelText: 'Numero del avion',
                  ),
                ),
                TextField(
                  controller: _disponibilidadController,
                  decoration: const InputDecoration(
                    labelText: 'Disponibilidad actual',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Modificar'),
                  onPressed: () async {
                    final int? idVuelo = int.tryParse(_idVueloController.text);
                    final String tipo_vuelo = _tipo_vueloController.text;
                    final int? avion = int.tryParse(_avionController.text);
                    final String disponibilidad = _disponibilidadController.text;
                    if (idVuelo != null) {
                      await _vuelos
                          .doc(documentSnapshot!.id)
                          .update({"idVuelo": idVuelo, "tipo_vuelo": tipo_vuelo, "avion": avion, "disponibilidad": disponibilidad});
                      _idVueloController.text = '';
                      _tipo_vueloController.text = '';
                      _avionController.text = '';
                      _disponibilidadController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _vuelos.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Vuelo eliminado')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: fondo,
        appBar: AppBar(
          title: const Center(child: Text('Todos los vuelos')),
          backgroundColor: color1,
        ),
        body: StreamBuilder(
          stream: _vuelos.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    color: color3,
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Codigo: ${documentSnapshot['idVuelo']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text("Tipo de vuelo: ${documentSnapshot['tipo_vuelo']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text("Numero de avion: ${documentSnapshot['avion']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text("Disponibilidad: ${documentSnapshot['disponibilidad']}", style: const TextStyle(fontSize: 23, color: Colors.white)),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit, color: Colors.white),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(Icons.delete, color: Colors.white),
                                onPressed: () => _delete(documentSnapshot.id)),
                          ],
                        ),
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: color3,
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}