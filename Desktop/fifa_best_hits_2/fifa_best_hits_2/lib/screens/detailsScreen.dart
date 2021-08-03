import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'fullListScreen.dart';
import 'menuScreen.dart';
import 'listenToTheSong.dart';

var selectedSong = '';

class FIFADetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    if (selectedFIFA == 'FIFA 2000'){
      selectedFIFA = 'FIFA 00';
    }
    else if (selectedFIFA == 'FIFA 2001'){
      selectedFIFA = 'FIFA 01';
    }
    else if (selectedFIFA == 'FIFA 2002'){
      selectedFIFA = 'FIFA 02';
    }
    else if (selectedFIFA == 'FIFA 2003'){
      selectedFIFA = 'FIFA 03';
    }
    else if (selectedFIFA == 'FIFA 2004'){
      selectedFIFA = 'FIFA 04';
    }
    else if (selectedFIFA == 'FIFA 2005'){
      selectedFIFA = 'FIFA 05';
    }

    return FIFADetailSate();
  }
}

class FIFADetailSate extends State<FIFADetail>{

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(FIFAimage)
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Menu', style: TextStyle(color: Colors.white, fontSize: isPhone ? 20 : 40),),
          ),
          body: Padding(padding: EdgeInsets.only(top: 10),child:
          ListView(
            children: [
              Center(
                child: Row(children: [
                  Image(image: AssetImage(clearImagesList[customIndex]),width: isPhone ? 50 : 120,height: isPhone ? 50 : 120,),
                  Container(width: isPhone ? 15 : 35, height: isPhone ? 10 : 30,),
                  Text(selectedFIFA, style: TextStyle(color: Colors.white, fontSize: isPhone ? 30 : 65, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ],mainAxisAlignment: MainAxisAlignment.center,),),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: ListView.builder(
                    itemCount: specificFIFASongsList.length,
                    itemBuilder: (BuildContext context, int index){

                      return Card(
                        color: Colors.transparent,
                          child:ListTile(

                        title: Text(specificFIFASongsList[index], style: TextStyle(color: Colors.white, fontSize: isPhone ? 15 : 35), textAlign: TextAlign.center,),
                        onTap: (){

                          if (specificFIFASongsList[index] == 'None of the Songs included in this FIFA I considered good...'){
                            // Nothing :) just show the text above
                          }
                          else {
                            selectedSong = specificFIFASongsList[index];

                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) {
                              return listenToTheSong();
                            }));
                          }
                        },
                      )
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          ),
        )
    );
    //);
  }

  getDataFromTextFile() async{

    int indexOfBracket;

    // Step 1 getting the raw data from the file and assigning it to a local variable
    String rawData;
    rawData = await rootBundle.loadString('assets/fifa_best_hits_by_revaus.txt');

    // Step 2 cleaning up the Specific list every time the Details page is loaded
    specificFIFASongsList.clear();

    setState(() { // Use setState or the app will make a HUGE MESS

      // Step 3 split the rawData to make a true list of songs
      allSongsList = rawData.split('~');
    });

    // Step 4 Put the songs in a specific list of the FIFA requested by the user
    for (dynamic song in allSongsList){
      if (song.contains(selectedFIFA)){

        // Elimination of [FIFA ##] for display
        indexOfBracket = song.indexOf(']');
        song = song.substring(indexOfBracket + 1);

        // <- Bye!
        song = song.replaceAll('<-', '');

        // Extra spaces adios!
        song = song.trim();

        // The following lines of code is an algorithm to replace the name of the countries with emojis of their flags
        song = song.replaceAll('AUSTRIA', '🇦🇹');
        song = song.replaceAll('JAPAN', '🇯🇵');
        song = song.replaceAll('UNITED KINGDON', '🇬🇧');
        song = song.replaceAll('SWEDEN', '🇸🇪');
        song = song.replaceAll('ENGLAND', '🏴󠁧󠁢󠁥󠁮󠁧󠁿');
        song = song.replaceAll('USA', '🇺🇸');
        song = song.replaceAll('NETHERLANDS', '🇳🇱');
        song = song.replaceAll('DENMARK', '🇩🇰');
        song = song.replaceAll('CANADA', '🇨🇦');
        song = song.replaceAll('GERMANY', '🇩🇪');
        song = song.replaceAll('SCOTLAND', '🏴󠁧󠁢󠁳󠁣󠁴󠁿');
        song = song.replaceAll('WALES', '🏴󠁧󠁢󠁷󠁬󠁳󠁿');
        song = song.replaceAll('SPAIN', '🇪🇸');
        song = song.replaceAll('VENEZUELA', '🇻🇪');
        song = song.replaceAll('SWITZERLAND', '🇨🇭');
        song = song.replaceAll('PUERTO RICO', '🇵🇷');
        song = song.replaceAll('JAMAICA', '🇯🇲');
        song = song.replaceAll('FRANCE', '🇫🇷');
        song = song.replaceAll('MEXICO', '🇲🇽');
        song = song.replaceAll('ITALY', '🇮🇹');
        song = song.replaceAll('GUINEA', '🇬🇳');
        song = song.replaceAll('PORTUGAL', '🇵🇹');
        song = song.replaceAll('BRAZIL', '🇧🇷');
        song = song.replaceAll('NORWAY', '🇳🇴');
        song = song.replaceAll('SOUTH KOREA', '🇰🇷');
        song = song.replaceAll('FINLAND', '🇫🇮');
        song = song.replaceAll('IRELAND', '🇮🇪');
        song = song.replaceAll('AUSTRALIA', '🇦🇺');
        song = song.replaceAll('HAITI', '🇭🇹');
        song = song.replaceAll('SOMALIA', '🇸🇴');
        song = song.replaceAll('MALAWI', '🇲🇼');
        song = song.replaceAll('GHANA', '🇬🇭');
        song = song.replaceAll('NORTHERN IRELA', '🏴󠁧󠁢󠁮󠁩󠁲󠁿');
        song = song.replaceAll('CUBA', '🇨🇺');
        song = song.replaceAll('SOUTH AFRICA', '🇿🇦󠁧󠁢󠁮󠁩󠁲󠁿');
        song = song.replaceAll('NEW ZEALAND', '🇳🇿󠁧󠁢󠁮󠁩󠁲󠁿');
        song = song.replaceAll('ARGENTINA', '🇦🇷󠁧󠁢󠁮󠁩󠁲󠁿');
        song = song.replaceAll('URUGUAY', '🇺🇾');
        song = song.replaceAll('SINGAPORE', '🇸🇬');
        song = song.replaceAll('RUSSIA', '🇷🇺');
        song = song.replaceAll('COLOMBIA', '🇨🇴');
        song = song.replaceAll('LITHUANIA', '🇱🇹');
        song = song.replaceAll('DOMINICAN REPUBLIC', '🇩🇴');
        song = song.replaceAll('KOSOVO', '🇽🇰');
        song = song.replaceAll('ALBANIA', '🇦🇱');
        song = song.replaceAll('GUERNSEY', '🇬🇬');
        song = song.replaceAll('ZIMBABWE', '🇿🇼');
        song = song.replaceAll('NIGERIA', '🇳🇬');
        song = song.replaceAll('HONDURAS', '🇭🇳');
        song = song.replaceAll('BELGIUM', '🇧🇪');
        song = song.replaceAll('ElectronicArts','🎮');
        // ... and here 3/3
        song = song.replaceAll('FIFA 00', 'FIFA 2000');
        song = song.replaceAll('FIFA 01', 'FIFA 2001');
        song = song.replaceAll('FIFA 02', 'FIFA 2002');
        song = song.replaceAll('FIFA 03', 'FIFA 2003');
        song = song.replaceAll('FIFA 04', 'FIFA 2004');
        song = song.replaceAll('FIFA 05', 'FIFA 2005');

        specificFIFASongsList.add(song);
      }
    }

    if (specificFIFASongsList.isEmpty){
      specificFIFASongsList.add('None of the Songs included in this FIFA I considered good...');
    }

    // ... here ... 2/3
    if (selectedFIFA == 'FIFA 00'){
      selectedFIFA = 'FIFA 2000';
    }
    else if (selectedFIFA == 'FIFA 01'){
      selectedFIFA = 'FIFA 2001';
    }
    else if (selectedFIFA == 'FIFA 02'){
      selectedFIFA = 'FIFA 2002';
    }
    else if (selectedFIFA == 'FIFA 03'){
      selectedFIFA = 'FIFA 2003';
    }
    else if (selectedFIFA == 'FIFA 04'){
      selectedFIFA = 'FIFA 2004';
    }
    else if (selectedFIFA == 'FIFA 05'){
      selectedFIFA = 'FIFA 2005';
    }

    specificFIFASongsList.shuffle();

  }

  @override
  void initState(){
    getDataFromTextFile();
    fullListOfSongs.clear(); // Avoid bug in fullListScreen
    super.initState();
  }

}