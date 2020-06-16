import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class DetailPage extends StatefulWidget {
  var title;
  var starString;
  var imageURLString;
  var numberString;
  var descString;
  var albumNameString;
  String lyricsString;
  DetailPage(
      {this.title,
      this.starString,
      this.imageURLString,
      this.numberString,
      this.descString,
      this.albumNameString});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  int _counter = 0;
  Color favouriteColor = Colors.black;

  AnimationController controller;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    controller = AnimationController(
        vsync: this, lowerBound: 0, upperBound: 1, duration: Duration());
    controller.addListener(() {});
  }


  Future<Container> getFavouriteSongListWidget() async {
    var list = [];
    var textList = <Widget>[];

    var index = 0;
    var result = await getFavouriteSongs();
    result.forEach((element) {
 
      var textwidget = ListTile(
          leading: Checkbox(
              value: true,
              
              onChanged: (bool onoff) {
                print(onoff);
                setState(() {
                  
                });
              }),
          title: Text(element));
      textList.add(textwidget);
      index++;
    });
    return Container(
      child: Column(children: textList),
    );
  }

  void setSongsToFavourite() async {
    var ud = await SharedPreferences.getInstance();
    var list = await ud.getStringList('favourite');
    if (list == null) {
      list = [];
    }
    list.add(widget.title);
    var isSuccess = await ud.setStringList('favourite', list);
    print(isSuccess);
  }

  void _loadData(String songName)async{
    if (widget.lyricsString != null){
     return;
    }
try {
    var urlString = "http://geci.me/api/lyric/" + songName + "/westlife";
    Response response = await Dio().get(urlString);
    Map data = response.data;
    List result = data['result'];
// 0:"aid" -> 1984925
// 1:"artist_id" -> 26872
// 2:"lrc" -> "http://s.gecimi.com/lrc/223/22388/2238836.lrc"
// 3:"sid" -> 2238836
// 4:"song" -> "Swear It Again"

    Map songInfo;
    String aid;
    String lrcString;
    if (result != null && result.length > 0){
songInfo = result[0];
   aid = songInfo['aid'].toString();
    }
    lrcString = songInfo['lrc'];
    _loadAlbumPreview(aid);
    _loadLrc(lrcString);
    // print(response);
  } catch (e) {
    print(e);
  }
  }

  void _loadLrc(String lrcUrlString)async{
    Response response = await Dio().get(lrcUrlString);
  String lrcString = response.data;
  setState(() {
    widget.lyricsString = lrcString;
  });
  //  print(lrcString);

  }
  void _loadAlbumPreview(String aidString)async{
    String urlString = "http://geci.me/api/cover/" + aidString;
   try {
     Response response = await Dio().get(urlString);
     print(response);
   }catch(e){
     print(e);
   }
  //  print(response);



  }
  Future<List<String>> getFavouriteSongs() async {
    var ud = await SharedPreferences.getInstance();
    var list = await ud.getStringList('favourite');
    return list;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
_loadData(widget.title);
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.red,
            title: Text('${widget.title}'),
          ),
          preferredSize: Size(double.infinity, 0)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context, {'name': 'renjingkai'});
                    },
                  ),
                  // Expanded(child: ListView(shrinkWrap: true,scrollDirection: Axis.vertical,children: <Widget>[
                  //   Text('data'),
                  // ],)),

                  IconButton(
                      color: favouriteColor,
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        setState(() {
                          if (favouriteColor == Colors.black) {
                            favouriteColor = Colors.red;
                          } else {
                            favouriteColor = Colors.black;
                          }
                        });
                      }),
                ],
              ),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 231, 236, 1)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.imageURLString),
                    // backgroundImage: Image.network('http://s.gecimi.com/cover/198/1984925.jpg'),
                  
                  ),
                ),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '${widget.title} \n\n',
                          style: Theme.of(context).textTheme.headline),
                      TextSpan(
                          text: 'Rate:${widget.starString}',
                          style: Theme.of(context).textTheme.title),
                    ])),

                    // Text('data\n'),

                    // Text('data'),
                    Text(
                      widget.numberString,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                // width: 200,
                // height: 200,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    // Text(
                    //   widget.lyricsString == null ? "Loading" : widget.lyricsString + '\n' + 'Introduction:' + widget.descString,
                    //   style: TextStyle(
                    //       fontSize: 17, letterSpacing: 1, wordSpacing: 2),
                    // ),
                    RichText(text: TextSpan(text: widget.lyricsString == null ? "Loading" : widget.lyricsString,
                    style: TextStyle(fontSize: 18, color: Colors.blue,wordSpacing: 2,
                    height: 1.4,
        
                    ),
                    children:[TextSpan(text:"\n Introduction  " + widget.albumNameString + "\n\n", 
                    style: TextStyle(fontSize: 30, color: Colors.red,fontWeight: FontWeight.bold)
                    
                    ),
                    TextSpan(text: widget.descString, 
                    style: TextStyle(fontSize: 16, color: Colors.black,wordSpacing: 1.5,
                    height: 1.2,)
                    )
                    
                    ] ),),
                  ],
                ),
              )),

              // Text('hahaha123'),
              //Expanded(child: SizedBox()),
              Container(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          setSongsToFavourite();
                          _counter++;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Color.fromRGBO(255, 212, 200, 1)),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: 120,
                        height: 44,
                        // color: Colors.lightBlue,
                        child: Row(
                          children: [
                            Text(
                              ' Add',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            //自制弹簧
                            Expanded(child: SizedBox()),
                            Icon(Icons.playlist_add)
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext btx) {
                              return FutureBuilder(
                                builder: (BuildContext context,
                                    AsyncSnapshot<Widget> sy) {
                                  if (sy.connectionState ==
                                      ConnectionState.done) {
                                    return sy.data;
                                  } else if (sy.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text("Waiting");
                                  }
                                  return Text("data");
                                },
                                future: getFavouriteSongListWidget(),
                              );
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 212, 200, 1),
                            shape: BoxShape.circle),
                        width: 60,
                        height: 60,
                        // padding: EdgeInsets.all(10),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                child: Icon(Icons.redeem),
                                decoration: BoxDecoration(
                                    color: Colors.pink[50],
                                    shape: BoxShape.circle),
                              ),
                              left: 5,
                              top: 5,
                              width: 50,
                              height: 50,
                            ),
                            Positioned(
                              child: Container(
                                child: Center(
                                    child: Text(
                                  '$_counter',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                  textAlign: TextAlign.center,
                                )),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                              left: 35,
                              top: 35,
                              width: 20,
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
