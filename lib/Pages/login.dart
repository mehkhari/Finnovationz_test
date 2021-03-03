import 'package:candidateharikrishna/Utils/StyleConfig.dart';
import 'package:candidateharikrishna/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formState=GlobalKey<FormState>();
  bool visible=true;
  visibility(){
    setState(() {
      visible=!visible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children:[
          Positioned(
            right: 0,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border:Border.all(color: AppTheme.commonColor.withOpacity(0.2),width: 20),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Icon(Icons.arrow_back_ios,size: 24,),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text('Login',style: AppTheme.loginHead.copyWith(fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Mobile No/Email',
                          labelStyle: AppTheme.common.copyWith(color: AppTheme.primary),
                          contentPadding: EdgeInsets.only(left: 15)
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Enter any EmailID/Mobile No';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: visible,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Type any Password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Password',
                        suffixIcon: InkWell(
                            onTap: visibility,
                            child: Icon(!visible?Icons.visibility:Icons.visibility_off,size: 18,color: AppTheme.commonColor,)),
                        labelStyle: AppTheme.common.copyWith(color: AppTheme.primary),
                        contentPadding: EdgeInsets.only(left: 15)
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forget Password',style: AppTheme.common.copyWith(fontSize: 12,decoration: TextDecoration.underline),),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 30),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: OutlineButton(
                  onPressed: (){
                    final isValid=_formState.currentState.validate();
                    if(isValid){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'CRUX',)));
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  ),
                  borderSide: BorderSide(color: AppTheme.commonColor,width: 2),
                  child: Text('Login',style: AppTheme.common.copyWith(fontSize: 18),),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Text('or login with')),
                  Expanded(child: Divider()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialMedia('F'),
                    SizedBox(
                      width: 20,
                    ),
                    socialMedia('G')
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?  ",
                  style: AppTheme.common.copyWith(color: AppTheme.primary),
                  children: [
                    TextSpan(
                      text: "Create an account",
                      style: AppTheme.common.copyWith(decoration: TextDecoration.underline)
                    )
                  ]
                ),
              ),
              Spacer()
            ],
          ),
        ),
        ),
        ]
      ),
    );
  }
  Widget socialMedia(type){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.withOpacity(0.5),width: 1)
      ),
      child: Text(type,style: AppTheme.common,),
    );
  }
}
