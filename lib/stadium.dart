import 'dart:io';
import 'package:flutter/material.dart';

class Stadium extends StatefulWidget {
  const Stadium({Key? key}) : super(key: key);

  @override
  State<Stadium> createState() => _StadiumState();
}

class _StadiumState extends State<Stadium> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                // big circle
                shape: BoxShape.circle,
                color: Colors.yellowAccent,
                border: Border.all(color: Colors.white, width: 10)),
            height: MediaQuery.of(context).size.height * 0.58, //450
            width: double.infinity,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.08,
            height: MediaQuery.of(context).size.height * 0.081,
            margin: EdgeInsets.only(top: 200, right: 10),
            padding: EdgeInsets.only(left: 5),
            child: RotatedBox(
              quarterTurns: 3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    side: BorderSide(color: Colors.white),
                    primary: Colors.white),
                onPressed: () => exit(0),
                child: Text(
                    textAlign: TextAlign.center,
                    'EXIT',
                    style: TextStyle(
                      fontFamily: 'Monoton',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 13,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
