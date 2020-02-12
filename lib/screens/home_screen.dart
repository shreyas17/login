import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../SizeConfig.dart';
import 'package:login_app/screens/dashboardOption.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_app/main.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SharedPreferences sharedPreferences;


  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route<dynamic> route) => false);
    }
  }
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Code Land", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: new Container(
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*5),
          padding: new EdgeInsets.all(24.0),
          child: Row(

            children: <Widget>[
              new Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=>  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardOption(),),
                    ),
                    child: new Card(

                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color(0xFFF2CE54),
                      child: new Container(
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                        height: SizeConfig.blockSizeVertical*25,
                        width: SizeConfig.blockSizeHorizontal*40,
                        child: new Column(
                          children: <Widget>[
                            new Text('Dashboard',textAlign: TextAlign.left,style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal*5,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Segoe-Ui",
                              color: Color(0xff794C17)
                            ),),
                            SizedBox(height: SizeConfig.blockSizeVertical*6,),
                            Image.asset('assets/pattern.png')
                          ],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    child: new Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color(0xFFDABBE4),
                      child: new Container(
margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                        height: SizeConfig.blockSizeVertical*25,
                        width: SizeConfig.blockSizeHorizontal*40,
                        child: new Column(
                          children: <Widget>[
                            new Text('Asset',textAlign: TextAlign.justify,style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*5,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Segoe-Ui",
                                color: Color(0xffB583C3)
                            ),),
                            new Text('Management',textAlign: TextAlign.justify,style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*5,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Segoe-Ui",
                                color: Colors.white
                            ),),
                            SizedBox(height: SizeConfig.blockSizeVertical*2,),
                            Image.asset('assets/asset1.png')
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              new Column(

                children: <Widget>[
                  GestureDetector(
                    child: new Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color(0xFF99DBEA),
                      child: new Container(
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                        height: SizeConfig.blockSizeVertical*25,
                        width: SizeConfig.blockSizeHorizontal*40,
                        child: new Column(
                          children: <Widget>[
                            new Text('Property',textAlign: TextAlign.left,style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*5,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Segoe-Ui",
                                color: Color(0xff42859B)
                            ),),
                            new Text('Management',textAlign: TextAlign.justify,style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*5,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Segoe-Ui",
                                color: Colors.white
                            ),),
                            SizedBox(height: SizeConfig.blockSizeVertical*2,),
                            Image.asset('assets/asset.png')
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: new Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color(0xFFed7272),
                      child: new Container(
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                        height: SizeConfig.blockSizeVertical*25,
                        width: SizeConfig.blockSizeHorizontal*40,
                        child: new Column(
                          children: <Widget>[
                            new Text('Incident',textAlign: TextAlign.left,style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*5,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Segoe-Ui",
                                color: Color(0xff6C2322)
                            ),),
                            new Text('Reporting',textAlign: TextAlign.justify,style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*5,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Segoe-Ui",
                                color: Colors.white
                            ),),
                            SizedBox(height: SizeConfig.blockSizeVertical*3.2,),
                            Image.asset('assets/asset2.png')
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
