import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:curso_disenios/src/routes/routes.dart';
import 'package:curso_disenios/src/theme/theme.dart';

class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: _PrincipalMenu(),
      body: _OptionList(),
    );
  }
}

class _OptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider( color: appTheme.primaryColorLight), 
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) {
        final item = pageRoutes[i];

        return ListTile(
          leading: FaIcon( item.icon, color: appTheme.accentColor
          ),
          title: Text( item.title ),
          trailing: Icon(Icons.chevron_right, color: appTheme.accentColor,),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => item.page ));
          },
        );
      } 
    );
  }
}

class _PrincipalMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final primaryColor = appTheme.currentTheme.primaryColor;
    final accentColor  = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[

            //Avatar
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 150,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Text('FL', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),

            //Options
            Expanded(
              child: _OptionList()
            ),

            //Dark Mode
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme, 
                activeColor: accentColor,
                onChanged: ( value ) => appTheme.darkTheme = value
              ),
            ),
            
            //Custom Mode
            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: accentColor),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.customTheme, 
                activeColor: accentColor,
                onChanged: ( value ) => appTheme.customTheme = value
              ),
            )

          ],
        ),
      ),
    );
  }
}