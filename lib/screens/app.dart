import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymmusic/screens/yourlibrary.dart';
import 'package:mymmusic/screens/home.dart';
import 'package:mymmusic/screens/search.dart';

import '../models/music.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _audioPlayer=new AudioPlayer();
  var Tabs=[];
  int currentTabIndex=0;
  bool isplaying=false;
  Music? music;

Widget miniPlayer(Music? music,{bool stop = false}){
  this.music=music;
  setState(() {});
  if(music==null){
    return SizedBox();
  }
  if(stop){
    _audioPlayer.stop();
    isplaying=false;
  }
  setState(() {  });
    Size deviceSize= MediaQuery.of(context).size;
    return AnimatedContainer(duration: const Duration(microseconds: 5),
      color: Colors.blueGrey,
    width: deviceSize.width,
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(music.image,
        fit: BoxFit.cover,),
        Text(music.name, style: TextStyle(color: Colors.white, fontSize: 20),),
        IconButton(onPressed: () async {
          isplaying=!isplaying;
          if(isplaying){
            await _audioPlayer.play(music.murl);
          }
          else{
            await _audioPlayer.pause();
          }
          setState(() {});
        },
          icon:isplaying?
        Icon(Icons.pause,color: Colors.white,)
            : Icon(Icons.play_arrow, color: Colors.white
        ),
        )
      ],
    ),
    );
  }
@override
  void initState() {
        super.initState();
        Tabs =[Home(miniPlayer), Search(), YourLibrary()];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (currentIndex){
              currentTabIndex=currentIndex;
              setState(() {});
            },
            selectedLabelStyle: TextStyle(color: Colors.white),
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black45,
            items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white,), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white,), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books, color: Colors.white),
            label: 'Your Library')
          ],),
        ],
      ),
    );
  }
}
