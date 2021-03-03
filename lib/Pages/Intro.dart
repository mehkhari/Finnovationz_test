import 'package:candidateharikrishna/Pages/Register.dart';
import 'package:candidateharikrishna/Pages/login.dart';
import 'package:candidateharikrishna/Utils/StyleConfig.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.album,size: 80,),
                    Container(
                        width: 110,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text('CRUX',style: TextStyle(color: AppTheme.primary,fontSize: 32),),
                            Text('PLAYLIST',style: AppTheme.common,),
                          ],
                        )),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 150,bottom: 20),
                    child: Text("Let's Get Started",style: AppTheme.loginHead.copyWith(fontWeight: FontWeight.bold),)),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: OutlineButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    borderSide: BorderSide(color: AppTheme.commonColor),
                    child: Text('Log in',style: AppTheme.common,),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(colors: [Colors.deepPurpleAccent,Colors.cyan])
                  ),
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)
                    ),
                    textColor: Colors.white,
                    color: Colors.transparent,
                    child: Text('Register new account',style: AppTheme.common.copyWith(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
