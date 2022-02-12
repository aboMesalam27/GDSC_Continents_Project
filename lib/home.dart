import 'package:flutter/material.dart';
import 'main.dart';
import 'Favorite.dart';
import 'HomeScreen.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentIndex = 0;
  List<Widget> Screen = [HomeScreen(), FavoriteScreen()];
  List<String> titleAppBar = ['Continents', "Favorite"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: w,
      body: Screen[currentIndex],
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blueGrey),
        title: Text(
          titleAppBar[currentIndex],
          style: TextStyle(color: b),
        ),
        centerTitle: true,
        backgroundColor: w,
        foregroundColor: w,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 7,
        backgroundColor: w,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.color_lens,),label: 'sdf'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star_border,
                color: b,
              ),
              label: 'Favorite')
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: w),
        child: Drawer(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("images/image01.gif"),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Around The World",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.orange),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Dark Mode",style: TextStyle(color:Colors.orange,fontSize: 15),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 140),
                    child: IconButton(
                        icon: Icon(
                          Icons.brightness_4_outlined,
                          size: 40,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          setState(() {
                            color();
                            Screen = [];
                            titleAppBar = [];
                            Screen = [HomeScreen(), FavoriteScreen()];
                            titleAppBar = ['Continents', "Favorite"];
                          });
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
