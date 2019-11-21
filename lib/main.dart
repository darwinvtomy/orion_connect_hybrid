import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orion_connect_hybrid/dummy/repo.dart';
import 'package:orion_connect_hybrid/pages/dashboard.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      color: Colors.black,
      title: 'Orion Connect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoardPage(
        title: 'Orion Connect App',
        company: RepoData.bawp,
      )
    );
  }
}

