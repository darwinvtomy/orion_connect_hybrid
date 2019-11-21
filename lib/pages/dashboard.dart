import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orion_connect_hybrid/dummy/data.dart';
import 'package:orion_connect_hybrid/model/company.dart';
import 'package:orion_connect_hybrid/pages/movie_detail.dart';
import 'package:orion_connect_hybrid/pages/video_player.dart';
import 'package:orion_connect_hybrid/widgets/featured/intro_page_item.dart';
import 'package:orion_connect_hybrid/widgets/featured/page_transformer.dart';
import 'package:orion_connect_hybrid/widgets/trailers/course_card.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage({
    Key key,
    this.title,
    @required this.company,
  }) : super(key: key);

  final String title;
  final Company company;

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  // String dashboardimage;
  var top = 0.0;
  bool _first = false;
  String frame1;
  String frame2;

  @override
  void initState() {
    frame1 = sampleItems[1].posterUrl;
    frame2 = sampleItems[0].posterUrl;

    super.initState();
  }

  _changeTheImage(int index) {
    {
      setState(() {
        if (index == 0) {
          _first = false;
          frame2 = sampleItems[index].posterUrl;
        } else {
          final int oddoreven = index % 2;
          switch (oddoreven) {
            case 0:
              {
                _first = false;
                frame2 = sampleItems[index].posterUrl;
              }
              break;
            default:
              {
                _first = true;
                frame2 = sampleItems[index].posterUrl;
              }
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);
    return Scaffold(
        backgroundColor: Colors.black,
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
/* fit: StackFit.loose,*/
children: <Widget>[
Positioned(
top: top,
child: ConstrainedBox(
                    constraints: new BoxConstraints(maxHeight: 650.0),
                    child: AnimatedCrossFade(
                      firstCurve: Curves.linear,
                      secondCurve: Curves.linear,
                      duration: const Duration(seconds: 1),
                      firstChild: Image.network(frame1),
                      secondChild: Image.network(frame2),
                      crossFadeState: _first
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                ),
                SingleChildScrollView(
                    child: Stack(
                  children: <Widget>[
                    Container(
                      height: 1000.0,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment(0.0, 0.0),
                          // 10% of the width, so there are ten blinds.
                          colors: [
                            const Color(0xFF000000),
                            const Color(0x8A000000),
                            const Color(0x1F000000),
                            const Color(0x1F000000),
                            const Color(0x1F000000),
                            const Color(0xDD000000),
                            const Color(0xDD000000),
                            const Color(0xFF000000),
                            const Color(0xFF000000)
                          ],
                          // whitish to gray
                          tileMode: TileMode
                              .clamp, // repeats the gradient over the canvas
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _createLogoAvathar(),
                        Container(
                          margin: const EdgeInsets.only(top: 250),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Action | Adventure | Comedy | Fantasy | Sci-Fi',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 4.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new FlatButton(
                                        padding: const EdgeInsets.all(8.0),
                                        textColor: Colors.white,
                                        onPressed: () =>
                                            debugPrint('BUY CLICKED'),
                                        child: new Text("RENT 12\$"),
                                      ),
                                      new FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => VideoApp()),
                                          );
                                        },
                                        textColor: Colors.white,
                                        padding: const EdgeInsets.all(8.0),
                                        child: new Text(
                                          "TRAILER",
                                        ),
                                      ),
                                      new FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => MovieDetails()),
                                          );
                                        },
                                        textColor: Colors.white,
                                        padding: const EdgeInsets.all(8.0),
                                        child: new Text(
                                          "INFO",
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    top: 4.0, left: 2.0, bottom: 4.0),
                                child: Text(
                                  'Featured Movies',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Color(0x42000000),
                                alignment: Alignment.center,
                                child: Center(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromHeight(200.0),
                                    child: PageTransformer(
                                      pageViewBuilder:
                                          (context, visibilityResolver) {
                                        return PageView.builder(
                                          onPageChanged: (int index) =>
                                              _changeTheImage(index),
                                          controller: PageController(
                                              viewportFraction: 0.85),
                                          itemCount: sampleItems.length,
                                          itemBuilder: (context, index) {
                                            final item = sampleItems[index];
                                            final pageVisibility =
                                                visibilityResolver
                                                    .resolvePageVisibility(
                                                        index);

                                            return IntroPageItem(
                                              item: item,
                                              pageVisibility: pageVisibility,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    top: 4.0, left: 2.0, bottom: 4.0),
                                child: Text(
                                  'Upcomming Movie Trailers',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: _createCourseScroller(),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    top: 4.0, left: 2.0, bottom: 4.0),
                                child: Text(
                                  'First Day First Show',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: _createCourseScroller(),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    top: 4.0, left: 2.0, bottom: 4.0),
                                child: Text(
                                  'Top 10 Movies Based on your Search',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: _createCourseScroller(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ))
              ],
            )));
  }

  Widget _createCourseScroller() {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child:
          /*Transform(
        transform: Matrix4.translationValues(
            widget.animation.courseScrollerXTranslation.value, 0.0, 0.0),
        child: */
          SizedBox.fromSize(
        size: Size.fromHeight(220.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.company.courses.length,
            itemBuilder: (BuildContext context, int index) {
              var course = widget.company.courses[index];
              return CourseCard(course);
            }),
      ),
//      ),
    );
  }

  Widget _createLogoAvathar() {
    return /*Transform(
      transform: Matrix4.diagonal3Values(widget.animation.avatharSize.value,
          widget.animation.avatharSize.value, 1.0),
      alignment: Alignment.center,
      child: */
        Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20.0, left: 10.0),
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              widget.company.logo,
              width: 100.0,
              height: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'First Day First Show',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
//      ),
    );
  }
}
