import 'package:candidateharikrishna/Utils/StyleConfig.dart';
import 'package:candidateharikrishna/main.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _firstStage=GlobalKey<FormState>();
  var _firstStage1=GlobalKey<FormState>();
  TextEditingController _password=TextEditingController();
  TextEditingController _password1=TextEditingController();
  int initialPage=0;
  bool visible=true;
  bool visible1=true;
  visibility(){
    setState(() {
      visible=!visible;
    });
  }
  visibility1(){
    setState(() {
      visible1=!visible1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
          children:[
            Positioned(
              left: initialPage==0?0:null,
              right: initialPage==1?0:null,
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
                child: initialPage==0?Column(
                  children: [
                    backTrack(),
                    Spacer(),
                    Text('Register an account',style: AppTheme.loginHead.copyWith(fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Form(
                      key: _firstStage,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value.isEmpty){
                                return 'Enter any Mobile No/EmailID';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Mobile No/Email',
                                labelStyle: AppTheme.common.copyWith(color: AppTheme.primary),
                                contentPadding: EdgeInsets.only(left: 15)
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: OutlineButton(
                        onPressed: (){
                          var value=_firstStage.currentState.validate();
                          if(value){
                            setState(() {
                              initialPage=1;
                            });
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        borderSide: BorderSide(color: AppTheme.commonColor,width: 2),
                        child: Text('Get OTP',style: AppTheme.common.copyWith(color: AppTheme.primary,fontSize: 18),),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text('or Register with')),
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
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pageNumbers('1',initialPage==0),
                        pageNumbers('2',initialPage==1),
                        pageNumbers('3',initialPage==2),
                      ],
                    ),
                  ],
                ): initialPage==1?Column(
                  children: [
                    backTrack(),
                    Spacer(),
                    Text('Enter 4 digit code',style: AppTheme.loginHead.copyWith(fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    PinCodeTextField(
                      pinBoxWidth: 50,
                      pinBoxHeight: 50,
                      pinBoxOuterPadding: EdgeInsets.all(10),
                      pinTextStyle: AppTheme.loginHead.copyWith(fontSize: 30),
                      pinBoxRadius: 4,
                      pinBoxBorderWidth: 1,
                      defaultBorderColor:AppTheme.primary.withOpacity(0.3),
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                    ),
                    SizedBox(height: 20,),
                    Text('Resend OTP',style: AppTheme.common.copyWith(fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: OutlineButton(
                        onPressed: (){
                          setState(() {
                            initialPage=2;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        borderSide: BorderSide(color: AppTheme.commonColor,width: 2),
                        child: Text('Next',style: AppTheme.common.copyWith(color: AppTheme.primary,fontSize: 18),),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pageNumbers('1',initialPage==0),
                        pageNumbers('2',initialPage==1),
                        pageNumbers('3',initialPage==2),
                      ],
                    ),
                  ],
                ):
                Column(
                  children: [
                    backTrack(),
                    Spacer(),
                    Text('Register an account',style: AppTheme.loginHead.copyWith(fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Form(
                      key: _firstStage1,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _password,
                            validator: (value){
                              if(value.isEmpty){
                                return 'Enter any Password';
                              }
                              return null;
                            },
                            obscureText: visible,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: InkWell(
                                    onTap: visibility,
                                    child: Icon(!visible?Icons.visibility:Icons.visibility_off,size: 18,color: AppTheme.commonColor,)),
                                labelStyle: AppTheme.common.copyWith(color: AppTheme.primary),
                                contentPadding: EdgeInsets.only(left: 15)
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (value){
                              if(_password.text!=value){
                                return 'Re-enter the Password';
                              }
                              return null;
                            },
                            obscureText: visible1,
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                suffixIcon: InkWell(
                                    onTap: visibility1,
                                    child: Icon(!visible1?Icons.visibility:Icons.visibility_off,size: 18,color: AppTheme.commonColor,)),
                                labelStyle: AppTheme.common.copyWith(color: AppTheme.primary),
                                contentPadding: EdgeInsets.only(left: 15)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: OutlineButton(
                        onPressed: (){
                          var val=_firstStage1.currentState.validate();
                          if(val){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'CRUX',)));
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        borderSide: BorderSide(color: AppTheme.commonColor,width: 2),
                        child: Text('Next',style: AppTheme.common.copyWith(color: AppTheme.primary,fontSize: 18),),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pageNumbers('1',initialPage==0),
                        pageNumbers('2',initialPage==1),
                        pageNumbers('3',initialPage==2),
                      ],
                    ),
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
  Widget pageNumbers(presentPage,activeState){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(presentPage,style: AppTheme.loginHead.copyWith(color: AppTheme.primary.withOpacity(!activeState?0.2:1),
          fontWeight: FontWeight.bold,fontSize: activeState?25:18),),
    );
  }
  Widget backTrack(){
    return Row(
      children: [
        InkWell(
          onTap: (){
            initialPage!=0?
                setState((){
                  initialPage--;
                }):
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Icon(Icons.arrow_back_ios,size: 24,),
          ),
        ),
      ],
    );
  }
}
