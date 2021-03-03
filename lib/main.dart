import 'package:candidateharikrishna/Pages/Home.dart';
import 'package:candidateharikrishna/Pages/Intro.dart';
import 'package:candidateharikrishna/Pages/Notification.dart';
import 'package:candidateharikrishna/Pages/Profile.dart';
import 'package:candidateharikrishna/Pages/login.dart';
import 'package:candidateharikrishna/Utils/StyleConfig.dart';
import 'package:flutter/material.dart';
import 'package:candidateharikrishna/Pages/Notification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(child: Intro()),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex=0;
  void onTapTapped(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  List<Widget> _children=[Home(),NotifyPage(),Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0),
            child: Icon(Icons.search,color: Colors.white,),
          )
        ],
        backgroundColor: AppTheme.primary,
        leading: Icon(Icons.disc_full),
        title: Text(widget.title,style: AppTheme.common.copyWith(color: Colors.white),),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppTheme.primary,
          onTap: onTapTapped,
          currentIndex: _currentIndex,
          items: [
        BottomNavigationBarItem(
            title: Text('Home',style: TextStyle(color: _currentIndex==0?AppTheme.commonColor:Colors.white),),
            icon: Icon(Icons.home,color: _currentIndex==0?AppTheme.commonColor:Colors.white,)),
            BottomNavigationBarItem(
                title: Text('Notification',style: TextStyle(color: _currentIndex==1?AppTheme.commonColor:Colors.white),),
                icon: Icon(Icons.notifications,color: _currentIndex==1?AppTheme.commonColor:Colors.white,)),
            BottomNavigationBarItem(
                title: Text('Profile',style: TextStyle(color: _currentIndex==2?AppTheme.commonColor:Colors.white),),
                icon: Icon(Icons.person,color: _currentIndex==2?AppTheme.commonColor:Colors.white,))
      ]),
    );
  }
}
