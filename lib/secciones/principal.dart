import 'package:flutter/material.dart';
import 'package:actividadactividadparcial4/secciones/avion.dart';
import 'package:actividadactividadparcial4/secciones/clientes.dart';
import 'package:actividadactividadparcial4/secciones/destinos.dart';
import 'package:actividadactividadparcial4/secciones/horarios.dart';
import 'package:actividadactividadparcial4/secciones/reservas.dart';
import 'package:actividadactividadparcial4/secciones/vuelos.dart';
import 'package:actividadactividadparcial4/colores/colores.dart';

class principal extends StatefulWidget {
  principal({Key ?key}) : super(key: key);

  @override
  _principalState createState() {
    return _principalState();
  }
}

class _principalState extends State<principal> {
  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    const List Opciones = [
      "Horarios de vuelos",
      "Todos los aviones",
      "Destinos",
      "Lista de clientes",
      "Todos los vuelos",
      "Todas las reservas",
    ];
    const List Iconos = [
      Icons.timer,
      Icons.flight,
      Icons.map_outlined,
      Icons.supervised_user_circle_sharp,
      Icons.flight_land,
      Icons.check_box,
    ];

    // TODO: implement build
    return Scaffold(
      backgroundColor: fondo,
      body: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Bienvenido usuario", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              Container(height: 10),
              const Text("Seleccione una opcion:", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              Container(height: 41),
              Column(
                children: List.generate(Opciones.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                          index==0?const horarios():index==1?const avion():index==2?const destinos():index==3?const clientes():index==4?const vuelos():index==5?const reservas():Container()
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 23, left: 12, right: 12),
                      child: Container(
                        height: 55,
                        width: ancho,
                        decoration: const BoxDecoration(
                            color: color3,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Icon(Iconos[index], color: Colors.white),
                              const SizedBox(width: 15),
                              Text(
                                Opciones[index], style: const TextStyle(
                                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}