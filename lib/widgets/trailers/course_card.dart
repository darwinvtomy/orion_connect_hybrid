import 'package:flutter/material.dart';
import 'package:orion_connect_hybrid/model/company.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  CourseCard(this.course);

  BoxDecoration _createShadowRoundCorners() {
    return BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0)
        ]);
  }

  Widget _createThumbnail() {
    return ClipRRect(

      borderRadius: BorderRadius.circular(5.0),

        child: FadeInImage(
          placeholder: AssetImage('assets/images/giphy.gif'),
          fadeInDuration: const Duration(milliseconds: 400),
          fadeOutDuration: const Duration(milliseconds: 200),
          image: NetworkImage(course.thumbnail),
          fit: BoxFit.cover,
      ),
    );
  }

/*  Widget _createLinkButton() {
    return Material(
      color: Colors.white24,
      type: MaterialType.circle,
      child: IconButton(
          icon: Icon(Icons.link), onPressed: () => debugPrint('Nothing')),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(

     /* padding: const EdgeInsets.all(8.0),*/
      margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 16.0),
      decoration: _createShadowRoundCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: _createThumbnail(),
          ),
    /*      Flexible(
            flex: 2,
            child: _createCourseInfo(),
          )*/
        ],
      ),
    );
  }

/*  Widget _createCourseInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 4.0, right: 4.0),
      child: Text(
        course.title,
        style: TextStyle(color: Colors.white.withOpacity(0.85)),
      ),
    );
  }*/
}
