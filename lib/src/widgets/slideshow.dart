import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  //Propiedades
  final List<Widget> slides;
  final bool positionTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  //Constructor
  const Slideshow({
    @required this.slides,
    this.positionTop      = false,
    this.primaryColor     = Colors.orange,
    this.secondaryColor   = Colors.grey,
    this.primaryBullet = 15.0,
    this.secondaryBullet  = 12.0
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor      = this.primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor    = this.secondaryColor;
              Provider.of<_SlideshowModel>(context).primaryBullet     = this.primaryBullet;
              Provider.of<_SlideshowModel>(context).secondaryBullet   = this.secondaryBullet;

              return _SlideshowStructure(positionTop: positionTop, slides: slides);
            },
          )
        ),
      ),
    );
  }
}

class _SlideshowStructure extends StatelessWidget {
  const _SlideshowStructure({
    Key key,
    @required this.positionTop,
    @required this.slides,
  }) : super(key: key);

  final bool positionTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.positionTop)_Dots( this.slides.length),
        Expanded(
          child: _Slides( this.slides )
        ),
        if (!this.positionTop)_Dots( this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int quantityDots;

  _Dots( this.quantityDots, );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate( this.quantityDots, (i) => _Dot(i))
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamanio = 0;
    Color color;

    if ((ssModel.currentPage >= this.index - 0.5 && ssModel.currentPage < this.index + 0.5)) {
      tamanio = ssModel.primaryBullet;
      color = ssModel.primaryColor;
    } else {
      tamanio = ssModel.secondaryBullet;
      color = ssModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamanio,
      height: tamanio,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() { 
    pageViewController.addListener(() {
      //print('Página actual:  ${pageViewController.page}');
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide( slide )).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  //Propiedades
  final Widget slide;

  //Constructos
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide
    );
  }
}


class _SlideshowModel with ChangeNotifier{
  double _currentPage = 0;
  Color _primaryColor;
  Color _secondaryColor;
  double _primaryBullet;
  double _secondaryBullet;

  double get currentPage => this._currentPage;
  set currentPage( double currentPage ) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color secondaryColor) {
    this._secondaryColor = secondaryColor;
  }
  
  double get primaryBullet => this._primaryBullet;
  set primaryBullet(double primaryBullet) {
    this._primaryBullet = primaryBullet;
  }

  double get secondaryBullet => this._secondaryBullet;
  set secondaryBullet(double secondaryBullet) {
    this._secondaryBullet = secondaryBullet;
  }
}