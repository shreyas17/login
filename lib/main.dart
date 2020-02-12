import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_app/screens/home_screen.dart';
import 'widgets/socialIcons.dart';
import 'customIcons.dart';
import 'dart:async';
import 'dart:convert';
import 'SizeConfig.dart';
import 'package:http/http.dart' as http;
import 'widgets/bottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;


  signIn(String username, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = json.encode({
      'username': username,
      'password': pass
    });
    var jsonResponse = null;
    var response = await http.post("https://ms-bg-hmis.azurewebsites.net/api/authentication/request", body: data,headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['access_token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }



  bool _isSelected =false;
  void _radio(){
    setState(() {
      _isSelected=!_isSelected;
    });
  }

  Widget radioButton(bool isSelected)=>Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(width: 2.0,color: Colors.black)
    ),
    child: isSelected?Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
        color: Colors.black
      ),
    ):Container()
  );
  Widget horizontalLine()=>Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: 1.0,
      color: Colors.black26.withOpacity(0.2),
    ),
  );



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1500,allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                child: Image.asset("assets/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
             Expanded(
               child:Image.asset('assets/image_02.png'),
             )
            ],
          ),
          SingleChildScrollView(
            padding:EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*6,right: SizeConfig.blockSizeHorizontal*6,top: SizeConfig.blockSizeVertical*12),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset("assets/logo.png",
                    width: SizeConfig.blockSizeHorizontal*14,
                    height: SizeConfig.blockSizeVertical*8,
                    ),
                    Text('BayGrape',style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: SizeConfig.safeBlockHorizontal*6,
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                    ),)

                  ],
                ),
                SizedBox(
                  height:SizeConfig.blockSizeVertical*8 ,
                ),
                Container(
            width: double.infinity,
            height: SizeConfig.blockSizeVertical*42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow:[BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0,15.0),
                  blurRadius: 15.0
              ),
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0,-10.0),
                    blurRadius: 15.0
                )],

            ),
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*5,right: SizeConfig.blockSizeHorizontal*5,top:SizeConfig.blockSizeVertical*2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Login',style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: SizeConfig.safeBlockHorizontal*6,
                    letterSpacing: 0.6,
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical*2,
                  ),
                  Text('Username',style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: SizeConfig.safeBlockHorizontal*3.5,
                  ),),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "username",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0
                        )
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical*2,
                  ),
                  Text('Password',style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: SizeConfig.safeBlockHorizontal*3.5,
                  ),),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: "password",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0
                        )
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical*2.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Forgot password",style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Poppins-Medium',
                        fontSize: SizeConfig.safeBlockHorizontal*4,
                      ),),

                    ],
                  )
                ],
              ),
            )
        ),
                SizedBox(
                  height:SizeConfig.blockSizeVertical*2.5 ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(

                      children: <Widget>[
                        SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                        GestureDetector(
                          onTap: _radio,
                          child: radioButton(_isSelected),
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                        Text('Remember Me',style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize:SizeConfig.safeBlockHorizontal*3.3,
                        ),)
                      ],
                    ),
                    InkWell(
                      child: Container(
                        width:  SizeConfig.blockSizeHorizontal*50,
                        height:  SizeConfig.blockSizeVertical*7,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFF17ead9),
                                  Color(0xff6078ea)
                                ]
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff6078ea).withOpacity(0.3),
                                  offset: Offset(0.0,8.0),
                                  blurRadius: 8.0

                              )
                            ]
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,


                          child: RaisedButton(

                            onPressed: _emailController.text == "" || _passwordController.text == "" ? null : () {
                              setState(() {
                                _isLoading = true;

                              });
                              signIn(_emailController.text, _passwordController.text);
                            },
                            elevation: 0.0,
                            color: Colors.transparent,
                            child: Text("Sign In", style: TextStyle(color: Colors.white70)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                 SizedBox(
                  height:SizeConfig.blockSizeVertical*4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    horizontalLine(),
                    Text('Social Login',style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize:SizeConfig.safeBlockHorizontal*5,
                    ),),
                    horizontalLine()
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialIcon(
                      colors: [
                        Color(0xFF102397),
                        Color(0xFF187adf),
                        Color(0xFF00eaf8),
                      ],
                      iconData: CustomIcons.facebook,
                      onPressed: () {},
                    ),
                    SocialIcon(
                      colors: [
                        Color(0xFFff4f38),
                        Color(0xFFff355d),
                      ],
                      iconData: CustomIcons.googlePlus,
                      onPressed: () {},
                    ),
                    SocialIcon(
                      colors: [
                        Color(0xFF17ead9),
                        Color(0xFF6078ea),
                      ],
                      iconData: CustomIcons.twitter,
                      onPressed: () {},
                    ),
                    SocialIcon(
                      colors: [
                        Color(0xFF00c6fb),
                        Color(0xFF005bea),
                      ],
                      iconData: CustomIcons.linkedin,
                      onPressed: () {},
                    )
                  ],
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }
}