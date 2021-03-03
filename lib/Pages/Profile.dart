import 'package:candidateharikrishna/Pages/Intro.dart';
import 'package:candidateharikrishna/Utils/StyleConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:NetworkImage('https://bit.ly/prosper-baba')
                ),
                border: Border.all(color: AppTheme.commonColor,width: 10),
                borderRadius: BorderRadius.circular(100)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Fahad Fazil'),
                  Icon(Icons.edit,size: 20,color: AppTheme.commonColor,)
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 10),
              child: Row(
                children: [
                  Text('FahadFazil@gmail.com'),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 10),
              child: Row(
                children: [
                  Text('8870595874'),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top:10.0,bottom: 30),
              child: Text('Change Password',style: AppTheme.common.copyWith(fontWeight: FontWeight.bold),),
            ),
            OutlineButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Intro()));
              },
              borderSide: BorderSide(
                color: AppTheme.signOut
              ),
              child: Text('Sign Out',style: AppTheme.common.copyWith(color: AppTheme.signOut),),
            )
          ],
        ),
      ),
    );
  }
}
