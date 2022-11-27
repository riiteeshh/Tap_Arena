import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import './stadium.dart';

class Button extends StatefulWidget {
  @override
  State<Button> createState() => ButtonState();
}

class ButtonState extends State<Button> {
  double playerx = 0.11; //blue
  double playery = 0.05; // red
  int selected_p1 = 0;
  int selected_p2 = 0;
  bool blue = false;
  bool red = false;
  bool isdisabledblue = false;
  bool isdisabledred = false;

  var images_p1 = [
    new Image.asset('asset/images/idle1.png'),
    new Image.asset('asset/images/man.png'),
    new Image.asset('asset/images/man2.png'),
    new Image.asset('asset/images/fall.png'),
  ];
  var images_p2 = [
    Image.asset('asset/images/idle1.png'),
    new Image.asset('asset/images/man2.png'),
    new Image.asset('asset/images/man.png'),
    new Image.asset('asset/images/fall.png'),
  ];

  @override
  Widget build(BuildContext context) {
    void moveup() // for blue // the limit of red= -0.23499999999999993
    {
      selected_p1 += 1;
      setState(() {
        if (selected_p1 > 2) {
          selected_p1 = 1;
        }

        playerx -= 0.05;
        playery -= 0.05;
        final assetsAudioPlayerb = AssetsAudioPlayer();

        assetsAudioPlayerb.open(
          Audio("assets/audios/punch.wav"),
        );

        if (playery < -0.44) {
          selected_p2 = 3;
          blue = true;
          red = false;
          assetsAudioPlayerb.pause();
          isdisabledred = true;
          bluewins();
        }
      });
    }

    void movedown() //for red // the limit for blue= 0.39999999999999997
    {
      selected_p2 += 1;
      setState(() {
        if (selected_p2 > 2) {
          selected_p2 = 1;
        }
        playerx += 0.05;
        playery += 0.05;
        final assetsAudioPlayerr = AssetsAudioPlayer();

        assetsAudioPlayerr.open(
          Audio("assets/audios/punch.wav"),
        );
        if (playerx > 0.51) {
          selected_p1 = 3;
          red = true;
          blue = false;
          assetsAudioPlayerr.pause();
          isdisabledblue = true;
          redwins();
        }
      });
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: MediaQuery.of(context).size.height * 0.82, //700
                      child: blue
                          ? Text(
                              'B L U E W I N S',
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'silkscreenb',
                              ),
                            )
                          : Text(''),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: MediaQuery.of(context).size.height * 0.28, //230
                      child: red
                          ? RotatedBox(
                              quarterTurns: 2,
                              child: Text(
                                'R E D W I N S',
                                style: TextStyle(
                                  fontSize: 39,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'silkscreenb',
                                ),
                              ),
                            )
                          : Text(''),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 30,
                                  enableFeedback: false,
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 184, 181, 181),
                                      width: 10),
                                  shape: const CircleBorder(),
                                  primary: Color.fromARGB(255, 209, 21, 7)),
                              child: Container(
                                width: 130,
                                height: 130,
                                alignment: Alignment.center,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: const Text(
                                  '  ',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              onPressed: isdisabledred ? () => null : movedown,
                            ),
                            Stadium(),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  enableFeedback: false,
                                  elevation: 30,
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 184, 181, 181),
                                      width: 10),
                                  shape: const CircleBorder(),
                                  primary: Color.fromARGB(255, 5, 121, 215),
                                ),
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: const Text(
                                    '  ',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                onPressed:
                                    isdisabledblue ? () => null : moveup),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment(0, playery),
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: images_p2[selected_p2], //redone
                          // width: 50,
                          // height: 50,
                          // color: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment(0, playerx),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: images_p1[selected_p1], //blueone
                        // width: 50,
                        // height: 50,
                        // color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void bluewins() {
    setState(() {
      if (playery <= -0.49) {
        print('blue wins');
        playerx = 0.11; //blue
        playery = 0.05;
        selected_p1 = 0;
        selected_p2 = 0;
        blue = false;
        red = false;
        isdisabledblue = false;
        isdisabledred = false;
      }
    });
  }

  void redwins() {
    setState(() {
      if (playerx >= 0.6) {
        print('red wins');
        playerx = 0.11; //blue
        playery = 0.05;
        selected_p1 = 0;
        selected_p2 = 0;
        blue = false;
        red = false;
        isdisabledblue = false;
        isdisabledred = false;
      }
    });
  }
}
