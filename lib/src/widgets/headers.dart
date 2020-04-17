import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only( 
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        )
      ),
    );
  }
}


class HeaderDiagonal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.moveTo( 0, size.height * 0.35 );
    path.lineTo( size.width, size.height * 0.30 );
    path.lineTo( size.width, 0 );
    path.lineTo( 0, 0 );


    canvas.drawPath(path, lapiz );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderTriangular extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo( size.width, size.height );
    path.lineTo( size.width, 0 );


    canvas.drawPath(path, lapiz );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}



class HeaderPico extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo( 0, size.height * 0.25 );
    path.lineTo( size.width * 0.5, size.height * 0.30 );
    path.lineTo( size.width, size.height * 0.25 );
    path.lineTo( size.width, 0 );
  


    canvas.drawPath(path, lapiz );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}



class HeaderCurvo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo( 0, size.height * 0.25 );
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25 );
    path.lineTo( size.width, 0 );

  


    canvas.drawPath(path, lapiz );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderWave extends StatelessWidget {
  final Color color;

  HeaderWave({
    this.color = Colors.red
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(this.color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  final Color color;

  _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = this.color;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo( 0, size.height * 0.35 );
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.40, size.width * 0.5, size.height * 0.35 );
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.30, size.width, size.height * 0.35 );
    path.lineTo( size.width, 0 );

  


    canvas.drawPath(path, lapiz );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}



class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color primaryColor;
  final Color secondaryColor;

  IconHeader({
    @required this.icon, 
    @required this.title, 
    @required this.subtitle, 
    this.primaryColor = Colors.blueAccent,
    this.secondaryColor = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(.7);

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          _IconHeaderBackground( primaryColor: this.primaryColor, secondaryColor: this.secondaryColor,),
          Positioned(
            top: -35,
            left: -55,
            child: FaIcon(this.icon, size: 200, color: Colors.white.withOpacity(0.15))
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 80, width: double.infinity,),
              Text(this.title, style: TextStyle(fontSize: 20, color: colorBlanco, letterSpacing: 0)),
              SizedBox(height: 20),
              Text(this.subtitle, style: TextStyle(fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold, letterSpacing: 5)),
              SizedBox(height: 20),
              FaIcon(this.icon, size: 70, color: Colors.white)
            ],
          )
        ],
      ),
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;

  const _IconHeaderBackground({this.primaryColor, this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 265,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        gradient: LinearGradient(
          colors: <Color>[
            this.primaryColor,
            this.secondaryColor
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
  }
}