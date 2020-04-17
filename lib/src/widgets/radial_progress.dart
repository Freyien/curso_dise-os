import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;

  const RadialProgress({
    @required this.porcentaje, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey
  });
  
  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double porcentajeAnimacion;

    controller.forward(from: 0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      //child: child,
      builder: (BuildContext context, Widget child) {
        porcentajeAnimacion = ( widget.porcentaje - diferenciaAnimar ) + (diferenciaAnimar * controller.value);

        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress( 
              porcentajeAnimacion,
              widget.colorPrimario,
              widget.colorSecundario
            ),
            child: Center(
              //Convertir a entero para animar porcentaje
              child: Text(
                '${porcentajeAnimacion.round()}%', 
                style: TextStyle(fontSize: 40, color: widget.colorPrimario),
              )
            ),
          )
        );
      },
    );

  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;

  _MiRadialProgress( 
    this.porcentaje,
    this.colorPrimario, 
    this.colorSecundario
  );

  @override
  void paint(Canvas canvas, Size size) {    
    //círculo completado
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * .5, size.height * .5);
    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = colorPrimario
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi / 2,
      arcAngle, 
      false, 
      paintArco
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}