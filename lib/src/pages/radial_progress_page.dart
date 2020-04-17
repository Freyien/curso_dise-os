import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:curso_disenios/src/widgets/radial_progress.dart';
import 'package:curso_disenios/src/theme/theme.dart';
import 'package:curso_disenios/src/widgets/appbar.dart';

class RadialProgressPage extends StatefulWidget {
  @override
  _RadialProgressPageState createState() => _RadialProgressPageState();
}

class _RadialProgressPageState extends State<RadialProgressPage> {
  double porcentaje      = 0.0;
  double porcentajeOne   = 0.0;
  double porcentajeTwo   = 0.0;
  double porcentajeThree = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(title: 'Radial Progress'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh, color: Colors.white),
        onPressed: (){
          setState(() {
            porcentaje      += 20;
            porcentajeOne   += 20 * 1.2;
            porcentajeTwo   += 20 * 1.5;
            porcentajeThree += 20 * 1.9;

            if (porcentaje > 100)
              porcentaje = 0;

            if (porcentajeOne > 100)
              porcentajeOne = 0;

            if (porcentajeTwo > 100)
              porcentajeTwo = 0;

            if (porcentajeThree > 100)
              porcentajeThree = 0;
          });
        }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, colorPrimario: Colors.green, colorSecundario: Colors.greenAccent,),
              CustomRadialProgress(porcentaje: porcentajeOne, colorPrimario: Colors.blue, colorSecundario: Colors.blueAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentajeTwo, colorPrimario: Colors.orange, colorSecundario: Colors.orangeAccent),
              CustomRadialProgress(porcentaje: porcentajeThree, colorPrimario: Colors.purple, colorSecundario: Colors.purpleAccent),
            ],
          )
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color colorPrimario;
  final Color colorSecundario;
  final double porcentaje;

  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.colorPrimario,
    @required this.colorSecundario
  });


  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    
    return Container(
      height: 180,
      width: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.colorPrimario,
        colorSecundario: currentTheme.textTheme.body1.color,
      ),
    );
  }
}