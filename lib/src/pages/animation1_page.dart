import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:curso_disenios/src/pages/twitter_page.dart';
import 'package:curso_disenios/src/pages/navegation_page.dart';

class Animation1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: FadeIn(child: Text('Animate_do')),
        actions: <Widget>[

          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter), 
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TwitterPage() ));
            }
          ),

          FadeIn(
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => Animation1Page() ));
              }
            ),
          )

        ],
      ),

      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: (){ 
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavigationPage() ));
          },
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40)
            ),

            FadeInDown(
              child: Text('Título', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
              delay: Duration(milliseconds: 200),
            ),

            FadeInDown(
              child: Text('Soy un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              delay: Duration(milliseconds: 800),
            ),

            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )

          ],
        ),
      ),
    );
  }
}