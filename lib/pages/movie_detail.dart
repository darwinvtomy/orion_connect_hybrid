import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetails> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: NotificationListener(
      onNotification: (v) {
        if (v is ScrollUpdateNotification) {
          print('Scroll Update ${v.scrollDelta.toString()}');
          if (v.metrics.axisDirection != AxisDirection.left &&
              v.metrics.axisDirection != AxisDirection.right)
            setState(() => top -= v.scrollDelta / 2);
        }
      },
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: top,
            child: Image.asset(
              'assets/images/dashboard.jfif',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 400),
            scrollDirection: Axis.vertical,
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Container(
                  height: 700,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 0.0),
                      // 10% of the width, so there are ten blinds.
                      colors: [
                        const Color(0x00000000),
                        const Color(0x8A000000),
                        const Color(0xDD000000),
                        const Color(0xDD000000),
                        const Color(0xFF000000),
                      ],
                      tileMode: TileMode
                          .clamp, // repeats the gradient over the canvas
                    ),
                  ),
                ),
                ClipPath(
                  clipper: DiagonalPathGradient2(),
                  child: Container(
                    height: 500,
                    color: Colors.black87,
                  ),
                ),
                ClipPath(
                  clipper: DiagonalPathPitchBlack(),
                  child: Container(
                    height: 540,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton.icon(
                            onPressed: null,
                            icon: Icon(
                              Icons.play_arrow,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Trailer',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          FloatingActionButton(
                            onPressed: null,
                            backgroundColor: Colors.black,
                            child: Text(
                              'U/A',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Avengers: Endgame',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                            SizedBox(
                              height: 13.0,
                            ),
                            Text(
                              'Action | Adventure | Fantasy | Sci-Fi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '12 \$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                                  textAlign: TextAlign.right,
                                  softWrap: true,
                                ),
                                Text(
                                  'Hindi | English | Tamil | Telugu',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.right,
                                  softWrap: true,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            IconButton(
                              padding: EdgeInsets.all(10.0),
                              onPressed: () {
                                debugPrint('Purchase Movie');
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            )
                            /*        Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: Colors.white10,
                              ),
                              child: Icon(
                                Icons.shopping_cart,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),*/
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Adrift in space with no food or water, '
                            'Tony Stark sends a message to Pepper Potts'
                            ' as his oxygen supply starts to dwindle.'
                            ' Meanwhile, the remaining Avengers -- Thor,'
                            ' Black Widow, Captain America and Bruce Banner'
                            ' -- must figure out a way to bring back their'
                            ' vanquished allies for an epic showdown with Thanos'
                            ' -- the evil demigod who decimated the planet and the universe.',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Director',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        'Anthony Russo and Joe Russo',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Star Cast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        'Brie Larson, Robert Downey Jr, Karen Gillan,'
                            ' Tessa Thompson, Scarlett Johansson, Chris Evans,'
                            ' Chris Hemsworth, Bradley Cooper, Winston Duke, Josh Brolin,'
                            'Evangeline Lilly,Pom Klementieff,Tom Holland, Dave Bautista, '
                            'Elizabeth Olsen, Paul Rudd,Sebastian Stan ',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Release Date',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        '26 April 2019 (USA)',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/dashboard.jfif',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 400),
            scrollDirection: Axis.vertical,
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Container(
                  height: 700,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 0.0),
                      // 10% of the width, so there are ten blinds.
                      colors: [
                        const Color(0x00000000),
                        const Color(0x8A000000),
                        const Color(0xDD000000),
                        const Color(0xDD000000),
                        const Color(0xFF000000),
                      ],
                      tileMode: TileMode
                          .clamp, // repeats the gradient over the canvas
                    ),
                  ),
                ),
                ClipPath(
                  clipper: DiagonalPathGradient2(),
                  child: Container(
                    height: 500,
                    color: Colors.black87,
                  ),
                ),
                ClipPath(
                  clipper: DiagonalPathPitchBlack(),
                  child: Container(
                    height: 540,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton.icon(
                            onPressed: null,
                            icon: Icon(
                              Icons.play_arrow,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Trailer',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          FloatingActionButton(
                            onPressed: null,
                            backgroundColor: Colors.black,
                            child: Text(
                              'U/A',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Avengers: Endgame',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                            SizedBox(
                              height: 13.0,
                            ),
                            Text(
                              'Action | Adventure | Fantasy | Sci-Fi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '12 \$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                                  textAlign: TextAlign.right,
                                  softWrap: true,
                                ),
                                Text(
                                  'Hindi | English | Tamil | Telugu',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.right,
                                  softWrap: true,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            IconButton(padding: EdgeInsets.all(10.0),onPressed: (){
                              debugPrint('Purchase Movie');
                            }, icon:  Icon(
                              Icons.shopping_cart,
                              size: 30.0,
                              color: Colors.white,
                            ), )
                    */ /*        Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: Colors.white10,
                              ),
                              child: Icon(
                                Icons.shopping_cart,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),*/ /*
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Adrift in space with no food or water, '
                            'Tony Stark sends a message to Pepper Potts'
                            ' as his oxygen supply starts to dwindle.'
                            ' Meanwhile, the remaining Avengers -- Thor,'
                            ' Black Widow, Captain America and Bruce Banner'
                            ' -- must figure out a way to bring back their'
                            ' vanquished allies for an epic showdown with Thanos'
                            ' -- the evil demigod who decimated the planet and the universe.',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Director',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        'Anthony Russo and Joe Russo',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Star Cast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        'Brie Larson, Robert Downey Jr, Karen Gillan,'
                            ' Tessa Thompson, Scarlett Johansson, Chris Evans,'
                            ' Chris Hemsworth, Bradley Cooper, Winston Duke, Josh Brolin,'
                            'Evangeline Lilly,Pom Klementieff,Tom Holland, Dave Bautista, '
                            'Elizabeth Olsen, Paul Rudd,Sebastian Stan ',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Release Date',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        '26 April 2019 (USA)',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}*/

class DiagonalPathPitchBlack extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height - 300)
      ..lineTo(size.width, size.height - 420)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DiagonalPathGradient1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height - 500)
      ..lineTo(size.width, size.height - 420)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DiagonalPathGradient2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height - 370)
      ..lineTo(size.width, size.height - 240)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
