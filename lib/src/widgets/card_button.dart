import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final Function onPress;

  const CardButton({
    this.icon = FontAwesomeIcons.helicopter, 
    this.title = 'Your text here', 
    this.primaryColor = Colors.blue, 
    this.secondaryColor = Colors.blueAccent, 
    @required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return _CardButtonBackground(this.icon, this.title, this.primaryColor, this.secondaryColor, this.onPress);
  }
}


class _CardButtonBackground extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final Function onPress;

  _CardButtonBackground(this.icon, this.title, this.primaryColor, this.secondaryColor, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _CardButtonContent(this.icon, this.title, this.primaryColor, this.onPress),

      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2), 
            offset: Offset(4, 6), 
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.primaryColor,
            this.secondaryColor,
          ]
        )
      ),
    );
  }
}

class _CardButtonContent extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color primaryColor;
  final Function onPress;

  _CardButtonContent(this.icon, this.title, this.primaryColor, this.onPress);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: RawMaterialButton(
        splashColor: this.primaryColor,
        onPressed: this.onPress,
        child: Stack(
          children: <Widget>[
            _PhantonIcon(this.icon),
            _CardButtonInfo(icon: this.icon, title: this.title),
          ],
        ),
      ),
    );
  }
}

class _PhantonIcon extends StatelessWidget {
  final IconData icon;

  _PhantonIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -20,
            top: -20,
            child: FaIcon( 
              this.icon, 
              size: 150, 
              color: Colors.white.withOpacity(0.2)
            )
          )
        ],
      ),

      
    );
  }
}

class _CardButtonInfo extends StatelessWidget {
  _CardButtonInfo({
    @required this.icon,
    @required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(
        this.icon, 
        color: Colors.white, 
        size: 40
      ),
      title: Text(
        this.title, 
        style: TextStyle(
          color: Colors.white, 
          fontSize: 18
        )
      ),
      trailing: FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    );
  }
}
