import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'dart:io' show Platform;

import 'detailsScreen.dart';

import 'package:google_fonts/google_fonts.dart';

import 'fullListScreen.dart';

import 'package:flutter_device_type/flutter_device_type.dart';


var rand = new Random();

var element = ''; // The name of the image displayed on the Background

var listOfFIFAs = ['FIFA STREET', 'FIFA 96', 'FIFA 97', 'FIFA 98', 'FIFA 99', 'FIFA 2000', 'FIFA 2001', 'FIFA 2002', 'FIFA 2003',
  'FIFA 2004', 'FIFA 2005', 'FIFA 06', 'FIFA 07', 'FIFA 08', 'FIFA 09', 'FIFA 10', 'FIFA 11', 'FIFA 12', 'FIFA 13', 'FIFA 14', 'FIFA 15',
  'FIFA 16', 'FIFA 17', 'FIFA 18', 'FIFA 19', 'FIFA 20', 'FIFA 21'];

var listOfFIFAs2 = ['FIFA STREET', 'FIFA 96', 'FIFA 97', 'FIFA 98', 'FIFA 99', 'FIFA 00', 'FIFA 01', 'FIFA 02', 'FIFA 03',
  'FIFA 04', 'FIFA 05', 'FIFA 06', 'FIFA 07', 'FIFA 08', 'FIFA 09', 'FIFA 10', 'FIFA 11', 'FIFA 12', 'FIFA 13', 'FIFA 14', 'FIFA 15',
  'FIFA 16', 'FIFA 17', 'FIFA 18', 'FIFA 19', 'FIFA 20', 'FIFA 21'];

var selectedFIFA;  // FIFA being selected on the first screen

var FIFAindex;
var FIFAimage;

var allSongsList = []; // The first raw list that will hold all the elements from the text file
var specificFIFASongsList = []; // The second list that will hold specific items from a selected FIFA

int customIndex = 0;

var imagesList = MenuState().loadImages();
var clearImagesList = MenuState().loadClearImages(); // Clear Images 4

// TODO: New Variables
bool iOSorAndroid = true;
bool isPhone = true;

class Menu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu>{

  var randNum = 0;

  var myName = 'Javier Noriega';

  @override
  Widget build(BuildContext context) {

    element = randomListItem(imagesList);

    return Container(
        width: double.infinity,
        height: 100,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(element)
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.only(top: 10),
                  child: Text('FIFA BEST HITS!',
                    style: TextStyle(color: Colors.white, fontSize: isPhone ? 40 : 70, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,),
                ),
                Padding(padding: EdgeInsets.only(top: 1),
                  child: GestureDetector(
                    child: Text('by $myName',
                      style: GoogleFonts.gugi(color: Colors.lightBlueAccent, fontSize: isPhone ? 20 : 36),
                      textAlign: TextAlign.center,),
                    onTap: (){
                      setState(() {
                        if (myName == 'Javier Noriega'){
                          myName = 'Revaus';
                        }
                        else if (myName == 'Revaus'){
                          myName = 'Javier Noriega';
                        }
                      });
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20),
                    child: Text('Choose a FIFA from the list below!',
                      style: TextStyle(color: Colors.white, fontSize: isPhone ? 20 : 34, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,)
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: isPhone ? MediaQuery.of(context).size.height * .65 : MediaQuery.of(context).size.height * .70,
                  padding: EdgeInsets.only(top: isPhone ? 15 : 5),
                  child: ListView.builder(
                      padding: EdgeInsets.all(15),
                      itemCount: listOfFIFAs.length,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          color: Colors.transparent,
                            child: ListTile(
                          /* trailing: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 40,
                              minWidth: 40,
                              maxHeight: 60,
                              maxWidth: 60,
                            ),
                            child: Image.asset(clearImagesList[index], width: 40, height: 40,),
                          ),*/ // Clear Images 3
                          title: Text('${listOfFIFAs[index]}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: isPhone ? 18 : 38),
                            textAlign: TextAlign.center,),
                          onTap: (){

                            // setState(() {

                            Navigator.push(context, MaterialPageRoute(builder: (context){

                              // If the algorithm reads FIFA 2004 for example it will confuse it with FIFA 20 the solution is here ... 1/3
                              if (listOfFIFAs[index] == 'FIFA 2000'){
                                selectedFIFA = 'FIFA 00';
                              }
                              else if (listOfFIFAs[index] == 'FIFA 2001'){
                                selectedFIFA = 'FIFA 01';
                              }
                              else if (listOfFIFAs[index] == 'FIFA 2002'){
                                selectedFIFA = 'FIFA 02';
                              }
                              else if (listOfFIFAs[index] == 'FIFA 2003'){
                                selectedFIFA = 'FIFA 03';
                              }
                              else if (listOfFIFAs[index] == 'FIFA 2004'){
                                selectedFIFA = 'FIFA 04';
                              }
                              else if (listOfFIFAs[index] == 'FIFA 2005'){
                                selectedFIFA = 'FIFA 05';
                              }

                              selectedFIFA = listOfFIFAs[index];

                              customIndex = index;

                              FIFAimage = chosenFIFABackground();

                              return FIFADetail();
                            })).then((value) => setState(() => {})); // Old Way (Solved with setState outside)

                            //});

                          },
                         )
                        );
                      }),
                ),
                Padding(padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: isPhone ? 50 : 100,
                            width: isPhone ? 50 : 100,
                            child: FloatingActionButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){

                                return fullListScreen();
                              })).then((value) => setState(() => {}));

                            },
                            child: Icon(Icons.search, size: isPhone ? 25 : 50,),
                            backgroundColor: Colors.blue,
                          )
                          ),
                          Container(width: isPhone ? 20 : 40,),
                          Text('<- Search a Song!', style: GoogleFonts.cookie(color: Colors.white, fontSize: isPhone ? 32 : 54, fontWeight: FontWeight.normal)
                          ),
                        ]
                    )
                )
              ],
            ),
          ),
        )
    );
  }

  List loadImages(){
    String img_06 = 'images/image_fifa_06.png';
    String img_07 = 'images/image_fifa_07.png';
    String img_08 = 'images/image_fifa_08.png';
    String img_09 = 'images/image_fifa_09.png';
    String img_10 = 'images/image_fifa_10.png';
    String img_11 = 'images/image_fifa_11.png';
    String img_12 = 'images/image_fifa_12.png';
    String img_13 = 'images/image_fifa_13.png';
    String img_14 = 'images/image_fifa_14.png';
    String img_15 = 'images/image_fifa_15.png';
    String img_16 = 'images/image_fifa_16.png';
    String img_17 = 'images/image_fifa_17.png';
    String img_18 = 'images/image_fifa_18.png';
    String img_19 = 'images/image_fifa_19.png';
    String img_20 = 'images/image_fifa_20.png';
    String img_21 = 'images/image_fifa_21.png';
    String img_96 = 'images/image_fifa_96.png';
    String img_97 = 'images/image_fifa_97.png';
    String img_98 = 'images/image_fifa_98.png';
    String img_99 = 'images/image_fifa_99.png';
    String img_00 = 'images/image_fifa_2000.png';
    String img_01 = 'images/image_fifa_2001.png';
    String img_02 = 'images/image_fifa_2002.png';
    String img_03 = 'images/image_fifa_2003.png';
    String img_04 = 'images/image_fifa_2004.png';
    String img_05 = 'images/image_fifa_2005.png';
    String img_street = 'images/image_fifa_street.png';

    var imagesList = [img_street, img_96, img_97, img_98, img_99, img_00, img_01, img_02, img_03,
      img_04, img_05, img_06, img_07, img_08, img_09, img_10, img_11, img_12, img_13, img_14,
      img_15, img_16, img_17, img_18, img_19, img_20, img_21];

    return imagesList;
  }

  List loadClearImages(){
    String clear00 = 'images/clear_fifa_00.png';
    String clear01 = 'images/clear_fifa_01.png';
    String clear02 = 'images/clear_fifa_02.png';
    String clear03 = 'images/clear_fifa_03.png';
    String clear04 = 'images/clear_fifa_04.png';
    String clear05 = 'images/clear_fifa_05.png';
    String clear06 = 'images/clear_fifa_06.png';
    String clear07 = 'images/clear_fifa_07.png';
    String clear08 = 'images/clear_fifa_08.png';
    String clear09 = 'images/clear_fifa_09.png';
    String clear10 = 'images/clear_fifa_10.png';
    String clear11 = 'images/clear_fifa_11.png';
    String clear12 = 'images/clear_fifa_12.png';
    String clear13 = 'images/clear_fifa_13.png';
    String clear14 = 'images/clear_fifa_14.png';
    String clear15 = 'images/clear_fifa_15.png';
    String clear16 = 'images/clear_fifa_16.png';
    String clear17 = 'images/clear_fifa_17.png';
    String clear18 = 'images/clear_fifa_18.png';
    String clear19 = 'images/clear_fifa_19.png';
    String clear20 = 'images/clear_fifa_20.png';
    String clear21 = 'images/clear_fifa_21.png';
    String clear96 = 'images/clear_fifa_96.png';
    String clear97 = 'images/clear_fifa_97.png';
    String clear98 = 'images/clear_fifa_98.png';
    String clear99 = 'images/clear_fifa_99.png';
    String clearSt = 'images/clear_fifa_street.png';

    var clearImagesList = [clearSt, clear96, clear97, clear98, clear99, clear00, clear01, clear02, clear03, clear04, clear05,
      clear06, clear07, clear08, clear09, clear10, clear11, clear12, clear13, clear14, clear15, clear16, clear17, clear18,
      clear19, clear20, clear21];

    return clearImagesList;
  }

  @override
  void initState(){
    loadImages();
    //loadClearImages(); // Clear Images 2

    fullListOfSongs.clear();

    // TODO: DOCUMENT
    if (Platform.isAndroid){
      iOSorAndroid = true;
      debugPrint('android $iOSorAndroid');
    }
    else if (Platform.isIOS){
      iOSorAndroid = false;
      debugPrint('iOS $iOSorAndroid');
    }

    if (Device.get().isTablet){
      isPhone = false; // false would be tablet
      debugPrint('Tablet? $isPhone');
    }
    else if (Device.get().isPhone){
      isPhone = true; // false would be tablet
      debugPrint('Phone? $isPhone');
    }
    // TODO: ...Til here

    super.initState();
  }
}

randomListItem(List imagesList) => imagesList[rand.nextInt(imagesList.length)];


String chosenFIFABackground () {
  for (dynamic i in imagesList){
    for (dynamic j in listOfFIFAs){
      if (selectedFIFA == j){
        FIFAindex = listOfFIFAs.indexOf(j);
        FIFAimage = imagesList[FIFAindex];
      }
    }
  }
  return FIFAimage;
}
