import 'package:flutter/material.dart';

import '../SizeConfig.dart';
import 'package:login_app/screens/graphs.dart';
class DashboardOption extends StatefulWidget {
  const DashboardOption({Key key}) : super(key: key);
  @override
  _DashboardOptionState createState() => _DashboardOptionState();
}

class _DashboardOptionState extends State<DashboardOption> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: new Container(
          color: Colors.white,
          padding: new EdgeInsets.all(30.0),
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*5),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                onTap: ()=>  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => App(),),
                ),
                child: new Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Color(0xFF99DBEA),

                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.all(8),
                        height: SizeConfig.blockSizeVertical*18,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                new Text('Property ',style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.safeBlockHorizontal*5,
                                    fontFamily: "Segoe-Ui",
                                    color: Color(0xff42859B)
                                ),),
                                new Text('Management',style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: SizeConfig.safeBlockHorizontal*5,
                                    fontFamily: "Segoe-Ui",
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/asset.png',),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: new Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Color(0xFFed7272),

                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.all(8),
                        height: SizeConfig.blockSizeVertical*18,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                new Text('Incident ',style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: SizeConfig.safeBlockHorizontal*5,
                                    fontFamily: "Segoe-Ui",
                                    color: Color(0xff6C2322)
                                ),),
                                new Text('Reporting',style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: SizeConfig.safeBlockHorizontal*5,
                                    fontFamily: "Segoe-Ui",
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/asset2.png',),
                      )
                    ],
                  ),
                ),
              ), 
              GestureDetector(
                child: new Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Color(0xFFDABBE4),

                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.all(8),
                        height: SizeConfig.blockSizeVertical*18,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                new Text('Asset ',style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: SizeConfig.safeBlockHorizontal*5,
                                    fontFamily: "Segoe-Ui",
                                    color: Color(0xffB583C3)
                                ),),
                                new Text('Management',style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: SizeConfig.safeBlockHorizontal*5,
                                    fontFamily: "Segoe-Ui",
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/asset1.png',),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: new Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Color(0xFF71BE94),

                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.all(8),
                        height: SizeConfig.blockSizeVertical*18,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                new Text('Health ',style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: SizeConfig.safeBlockHorizontal*5,
                                    fontFamily: "Segoe-Ui",
                                    color: Color(0xff358062)
                                ),),
                                new Text('and Social',style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: SizeConfig.safeBlockHorizontal*5,
                                    fontFamily: "Segoe-Ui",
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/asset3.png',),
                      )
                    ],
                  ),
                ),
              ),

 




            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text('Dashboard')),
          BottomNavigationBarItem(

              icon: Icon(Icons.person), title: Text('Logout')),
        ],
      )
    );
  }
}
