import 'dart:convert';
import 'package:dsc_world/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List europe = [];
List africa = [];
List asia = [];
List southamerica = [];
List notrhamerica = [];
List oceania = [];
List australia = [];
List antarktika = [];
List fav = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(10),
        color: w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButtonDetails("images/photo7.jpg", "Africa", africa),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButtonDetails(
                      "images/photo8.jpg", "Antarctica ", antarktika),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButtonDetails("images/photo6.jpg", "Asia ", asia),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButtonDetails(
                      "images/photo4.jpg", "Australia ", australia),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButtonDetails("images/photo1.jpg", "Europe ", europe),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButtonDetails(
                      "images/photo2.jpg", "North America", notrhamerica),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButtonDetails(
                    "images/photo3.jpg", "South America", southamerica),
              )
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        //color: Colors.red,
      ),
    );
  }

  Widget ElevatedButtonDetails(image, text, list) {
    var o = Colors.blueGrey;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: o,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Caraa(list, text);
          }));
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage("$image"),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "$text",
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }
}

class Caraa extends StatefulWidget {
  String name;
  List value;

  Caraa(this.value, this.name);

  @override
  _CaraaState createState() => _CaraaState();
}

class _CaraaState extends State<Caraa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
      backgroundColor: w,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.value[index]['name'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        IconButton(
                          icon: fav.contains(widget.value[index])
                              ? Icon(Icons.star, color: Colors.orange)
                              : Icon(
                                  Icons.star_border,
                                ),
                          onPressed: () {
                            setState(() {
                              if (fav.contains(widget.value[index])) {
                                fav.remove(widget.value[index]);
                              } else {
                                fav.add(widget.value[index]);
                              }
                            });
                          },
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
