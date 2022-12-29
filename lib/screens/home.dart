import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mymmusic/models/category.dart';
import 'package:mymmusic/models/music.dart';
import 'package:mymmusic/services/category_operations.dart';
import 'package:mymmusic/services/music_operations.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);

  Widget createCategory(Categ category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Image.network(
            category.imageurl,
            fit: BoxFit.cover,
          ),
          Padding(
          padding: EdgeInsets.only(left: 10),
          child:Text(
            category.name,
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Categ> categorylist = CategoryOperations.getCategories();
    List<Widget> categories =
        categorylist.map((Categ category) => createCategory(category)).toList();
    return categories;
  }

  Widget createMusic(Music music){
    return Padding(
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 200,
          child: InkWell(
            onTap: (){
              _miniPlayer(music, stop:true);
            },
            child: Image.network(music.image,
            fit: BoxFit.cover,),
          ),
        ),
        Text(music.name, style: TextStyle(color: Colors.white)),
        Text(music.desc, style: TextStyle(color: Colors.white))
      ],
    )
    );
  }

  Widget createmusiclist(String label){
    List<Music> musiclist=MusicOperatiions.getMusic();
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
          Container(
            height: 300,
             child: ListView.builder(
               // padding: EdgeInsets.all(5HP6Cq12LuvtHD4s848xH),
                 scrollDirection: Axis.horizontal,
                 itemBuilder:(ctx,index){
            return createMusic(musiclist[index]);
          }, itemCount: musiclist.length)
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      height:280,
      padding: EdgeInsets.all(10),
      child: GridView.count(
        childAspectRatio: 5/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: createListOfCategories(),
      ),
    );
  }
  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.settings),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child:Container(
        child: Column(children: [
          createAppBar('Good Morning'),
          SizedBox(
            height: 5,
          ),
          createGrid(),
          createmusiclist("Music for you"),
          createmusiclist("Popular Playlist")
        ]),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey.shade300, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // ignore: prefer_const_literals_to_create_immutables
                stops: [0.1, 0.3])),
      )),
    );
  }
}
