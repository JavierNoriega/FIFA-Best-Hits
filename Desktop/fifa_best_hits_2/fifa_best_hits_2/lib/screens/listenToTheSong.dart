import 'package:flutter/material.dart';

import 'menuScreen.dart';
import 'detailsScreen.dart';

import 'package:url_launcher/url_launcher.dart';

class listenToTheSong extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return listenToTheSongState();
  }

}

class listenToTheSongState extends State<listenToTheSong>{

  // Launching The YouTube Search 3
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url, forceSafariVC: true, forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    Future<void>? _launched;

    // & - 1
    if (selectedSong.contains('&')){
      selectedSong = selectedSong.replaceAll('&', '%26');
    }

    // Launching The YouTube Search 1
    String toLaunch = 'https://www.youtube.com/results?search_query=$selectedSong';

    // & - 2
    if (selectedSong.contains('%26')){
      selectedSong = selectedSong.replaceAll('%26', '&');
    }

    var indexFlag = toLaunch.indexOf('{');

    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(FIFAimage)
            )
        ),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(selectedFIFA, style: TextStyle(fontSize: isPhone ? 20 : 40),),
            ),
            backgroundColor: Colors.transparent,
            body: ListView(

              children: [
                Padding(
                  padding: EdgeInsets.only(top: isPhone ? 90 : 160),
                  child: Text(selectedSong,
                    style: TextStyle(color: Colors.white, fontSize: isPhone ? 20.0 : 40.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: isPhone ? 30 : 70),
                    child: Image(image: AssetImage(clearImagesList[customIndex]), width: isPhone ? 170 : 370, height: isPhone ? 200 : 400,)),
                Padding(
                    padding: EdgeInsets.only(top: isPhone ? 30 : 70, left: 30, right: 30),
                    child: SizedBox(
                        height: isPhone ? 50 : 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: Text('Watch On Youtube!', style: TextStyle(color: Colors.white, fontSize: isPhone ? 20 : 50, fontWeight: FontWeight.bold),),
                            onPressed: (){
                              setState(() {
                                if (selectedSong.contains('Track 11')){
                                  selectedSong = 'FIFA+96+Track+11';
                                  toLaunch = 'https://www.youtube.com/results?search_query=$selectedSong';
                                  // Launching The YouTube Search 2
                                  _launchInBrowser(toLaunch);
                                  selectedSong = 'Track 11';

                                } else if (selectedSong.contains('[Original Version]') || selectedSong.contains('[Different Version]')){
                                  selectedSong = selectedSong.substring(selectedSong.indexOf(']') + 1, selectedSong.length);
                                  indexFlag = selectedSong.indexOf('{');
                                  selectedSong = selectedSong.substring(0, indexFlag);
                                  // Launching The YouTube Search 2
                                  selectedSong = selectedSong.replaceAll(' ', '+'); // TODO: Maybe document this
                                  selectedSong = selectedSong.replaceAll('&', '%26');
                                  //debugPrint(selectedSong);
                                  toLaunch = 'https://www.youtube.com/results?search_query=$selectedSong';
                                  _launchInBrowser(toLaunch);
                                  selectedSong = selectedSong.replaceAll('%26', '&');
                                  selectedSong = selectedSong.replaceAll('+', ' ');
                                }

                                else {
                                  indexFlag = selectedSong.indexOf('{');
                                  selectedSong = selectedSong.substring(0, indexFlag);
                                  selectedSong = selectedSong.replaceAll(' ', '+');
                                  selectedSong = selectedSong.replaceAll('&', '%26');
                                  toLaunch = 'https://www.youtube.com/results?search_query=$selectedSong';
                                  // Launching The YouTube Search 2 TODO: Also document the checker in the three cases
                                  //toLaunch = toLaunch.replaceAll(' ', '+');
                                  _launchInBrowser(toLaunch);
                                  selectedSong = selectedSong.replaceAll('%26', '&');
                                  selectedSong = selectedSong.replaceAll('+', ' ');

                                }
                              });
                            }
                        )
                    )
                )
              ],
            )
        )
    );
  }

}