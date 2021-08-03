import 'package:fifa_best_hits_2/screens/menuScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

var fullListBGDeterminer = false;
var fullListBG = '';

var fullListOfSongsRaw = [];
var fullListOfSongs = [];

var selectedSong = '';
var selectedSongBracketIndex = 0;

var a = '';

var selectedImage = '';

var fullListOfSongsUpperCase = [];

var songNotFound = true;

class fullListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return fullListScreenState();
  }
}

class fullListScreenState extends State<fullListScreen>{

  // Launching The YouTube Search 3
  Future<void> _launchInBrowser(String url) async{
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

    songNotFound = true;

    if (fullListBGDeterminer == false) {
      fullListBG = randomListItem(imagesList);
      fullListBGDeterminer = true;
    }

    // Launching The YouTube Search 1
    String toLaunch = 'https://www.youtube.com/results?search_query=$selectedSong';

    String getToLaunch (){
      return toLaunch;
    }

    a = getToLaunch();

    return WillPopScope(
      onWillPop: () async{
        fullListOfSongs.clear();  // Anti-Bug on the List
        fullListBGDeterminer = false; // Anti-Bug for the BG Image
        Navigator.of(context).pop(true);
        return true;
      },
      child: Container(
        width: double.infinity,
        height: 100,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(fullListBG)
            )
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Menu', style: TextStyle(fontSize: isPhone ? 20 : 40),),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Form(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: isPhone ? 10 : 20, top: isPhone ? 0 : 15),
                  child: Text('THE FULL LIST! 🔥',
                    style: GoogleFonts.rancho(color: Colors.white, fontSize: isPhone ? 40: 70),
                    textAlign: TextAlign.center,),),
                CupertinoSearchTextField(
                  backgroundColor: Colors.black,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isPhone ? 20 : 35
                  ),

                  onChanged: (userSearch){

                    userSearch = userSearch.toUpperCase(); // This is basically so it is not case sensitive

                    fullListOfSongs.clear(); // Cleaning up the selection of songs when the user types

                    for (dynamic song in fullListOfSongsUpperCase){
                      // song.toLowerCase();
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
                      song = song.replaceAll('ElectronicArts', '🎮');
                      song = song.replaceAll('FIFA 00', 'FIFA 2000');
                      song = song.replaceAll('FIFA 01', 'FIFA 2001');
                      song = song.replaceAll('FIFA 02', 'FIFA 2002');
                      song = song.replaceAll('FIFA 03', 'FIFA 2003');
                      song = song.replaceAll('FIFA 04', 'FIFA 2004');
                      song = song.replaceAll('FIFA 05', 'FIFA 2005');
                      if (song.contains(userSearch)){
                        songNotFound = false;
                        fullListOfSongs.add(song);
                        setState(() {
                        });
                      }
                      else {
                        songNotFound = true;
                        setState(() {
                        });
                      }
                    }
                    userSearch = '';
                  },
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Padding(padding: EdgeInsets.all(15),
                        child: ListView.builder(
                            itemCount: songNotFound ? fullListOfSongs.length : 1,
                            itemBuilder: (BuildContext context, int index){
                              return Card(color: Colors.transparent, child: ListTile(
                                title: Text(songNotFound ? fullListOfSongs[index] : '', style: TextStyle(color: Colors.white, fontSize: isPhone ? 18 : 35), textAlign: TextAlign.center,),
                                onTap: (){
                                  selectedSong = fullListOfSongs[index];
                                  showDialog(
                                      context: context,
                                      builder: (_) => alertdialog(),
                                      barrierDismissible: true);
                                },
                              )
                              );
                            })
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget alertdialog(){

    if (selectedSong.contains('FIFA 21')){
      selectedImage = 'images/clear_fifa_21.png';
    }
    else if (selectedSong.contains('FIFA 19')){
      selectedImage = 'images/clear_fifa_19.png';
    }
    else if (selectedSong.contains('FIFA 18')){
      selectedImage = 'images/clear_fifa_18.png';
    }
    else if (selectedSong.contains('FIFA 17')){
      selectedImage = 'images/clear_fifa_17.png';
    }
    else if (selectedSong.contains('FIFA 16')){
      selectedImage = 'images/clear_fifa_16.png';
    }
    else if (selectedSong.contains('FIFA 15')){
      selectedImage = 'images/clear_fifa_15.png';
    }
    else if (selectedSong.contains('FIFA 14')){
      selectedImage = 'images/clear_fifa_14.png';
    }
    else if (selectedSong.contains('FIFA 13')){
      selectedImage = 'images/clear_fifa_13.png';
    }
    else if (selectedSong.contains('FIFA 12')){
      selectedImage = 'images/clear_fifa_12.png';
    }
    else if (selectedSong.contains('FIFA 11')){
      selectedImage = 'images/clear_fifa_11.png';
    }
    else if (selectedSong.contains('FIFA 10')){
      selectedImage = 'images/clear_fifa_10.png';
    }
    else if (selectedSong.contains('FIFA 09')){
      selectedImage = 'images/clear_fifa_09.png';
    }
    else if (selectedSong.contains('FIFA 08')){
      selectedImage = 'images/clear_fifa_08.png';
    }
    else if (selectedSong.contains('FIFA 07')){
      selectedImage = 'images/clear_fifa_07.png';
    }
    else if (selectedSong.contains('FIFA 06')){
      selectedImage = 'images/clear_fifa_06.png';
    }
    else if (selectedSong.contains('FIFA 2005')){
      selectedImage = 'images/clear_fifa_05.png';
    }
    else if (selectedSong.contains('FIFA 2004')){
      selectedImage = 'images/clear_fifa_04.png';
    }
    else if (selectedSong.contains('FIFA 2003')){
      selectedImage = 'images/clear_fifa_03.png';
    }
    else if (selectedSong.contains('FIFA 2002')){
      selectedImage = 'images/clear_fifa_02.png';
    }
    else if (selectedSong.contains('FIFA 2001')){
      selectedImage = 'images/clear_fifa_01.png';
    }
    else if (selectedSong.contains('FIFA 2000')){
      selectedImage = 'images/clear_fifa_00.png';
    }
    else if (selectedSong.contains('FIFA 99')){
      selectedImage = 'images/clear_fifa_99.png';
    }
    else if (selectedSong.contains('FIFA 98')){
      selectedImage = 'images/clear_fifa_98.png';
    }
    else if (selectedSong.contains('FIFA 97')){
      selectedImage = 'images/clear_fifa_97.png';
    }
    else if (selectedSong.contains('FIFA 96')){
      selectedImage = 'images/clear_fifa_96.png';
    }
    else if (selectedSong.contains('FIFA STREET')){
      selectedImage = 'images/clear_fifa_street.png';
    }
    else {
      selectedImage = 'images/clear_fifa_20.png';
    }

    selectedSongBracketIndex = selectedSong.indexOf(']');
    selectedSongBracketIndex = selectedSongBracketIndex + 1;

    selectedSong = selectedSong.substring(selectedSongBracketIndex, selectedSong.length);

    if (selectedSong.contains('&')){
      selectedSong = selectedSong.replaceAll('&', '%26');
    }

    // Launching The YouTube Search 1
    String toLaunch = 'https://www.youtube.com/results?search_query=$selectedSong';
    int indexFlag = toLaunch.indexOf('{');

    if (selectedSong.contains('%26')){
      selectedSong = selectedSong.replaceAll('%26', '&');
    }

    return AlertDialog(
      title: Text(selectedSong, style: TextStyle(color: Colors.white),),
      content: Image(image: AssetImage(selectedImage),),
      actions: [
        TextButton(
          child: Text('Watch On YouTube'),
          onPressed: (){
            if (selectedSong.contains('TRACK 11')){
              //selectedSong = 'FIFA 96 Track 11';
              selectedSong = 'FIFA+96+Track+11';
              toLaunch = 'https://www.youtube.com/results?search_query=$selectedSong';
              debugPrint(selectedSong);
              debugPrint(toLaunch);
              _launchInBrowser(toLaunch);
            } else if (selectedSong.contains('[ORIGINAL VERSION]') || selectedSong.contains('[DIFFERENT VERSION]')){
              selectedSong = selectedSong.replaceAll(' ', '+'); // TODO: Maybe document this
              indexFlag = selectedSong.indexOf('{');
              selectedSong = selectedSong.substring(0, indexFlag);
              selectedSong = selectedSong.substring(selectedSong.indexOf(']') + 1, selectedSong.length);
              toLaunch = 'https://www.youtube.com/results?search_query=$selectedSong';
              _launchInBrowser(toLaunch);
            } else {
              selectedSong = selectedSong.replaceAll(' ', '+');
              indexFlag = selectedSong.indexOf('{');
              selectedSong = selectedSong.substring(0, indexFlag);
              selectedSong = selectedSong.substring(selectedSong.indexOf(']') + 1, selectedSong.length);
              toLaunch = 'https://www.youtube.com/results?search_query=$selectedSong';
              // Launching The YouTube Search 2
              _launchInBrowser(toLaunch);
            }
          },
        ),
        TextButton(
          child: Text('Dismiss'),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
      backgroundColor: CupertinoColors.darkBackgroundGray,
    );
  }

  getAllDataFromTextFile() async{

    // Step 1 getting the raw data from the file and assigning it to a local variable
    String rawData;
    rawData = await rootBundle.loadString('assets/fifa_best_hits_by_revaus.txt');

    // Step 2 cleaning up the Specific list every time the Details page is loaded
    fullListOfSongsRaw.clear();

    setState(() { // Use setState or the app will make a HUGE MESS

      // Step 3 split the rawData to make a true list of songs
      fullListOfSongsRaw = rawData.split('~');
    });

    // Step 4 Put the songs in a specific list of the FIFA requested by the user
    for (dynamic song in fullListOfSongsRaw){

      if (song.isNotEmpty) {

        // <- Bye!
        song = song.replaceAll('<-', '');

        // Extra spaces adios!
        song = song.trim();

        // The following lines of code is an algorithm to replace the name of the countries with emojis of their flags
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
        song = song.replaceAll('ElectronicArts', '🎮');
        // ... and here 3/3
        song = song.replaceAll('FIFA 00', 'FIFA 2000');
        song = song.replaceAll('FIFA 01', 'FIFA 2001');
        song = song.replaceAll('FIFA 02', 'FIFA 2002');
        song = song.replaceAll('FIFA 03', 'FIFA 2003');
        song = song.replaceAll('FIFA 04', 'FIFA 2004');
        song = song.replaceAll('FIFA 05', 'FIFA 2005');

        song = song.toUpperCase();

        fullListOfSongs.add(song);
      }
    }

    fullListOfSongs.shuffle();

    fullListOfSongsUpperCase.clear();

    for (String song in fullListOfSongs){
      song = song.toUpperCase();
      fullListOfSongsUpperCase.add(song);
    }

  }

  @override
  void initState(){
    getAllDataFromTextFile();
    super.initState();
  }

}