// import 'dart:js';

import 'package:awesome/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SongCard.dart';
import 'TabbarItem.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: Colors.red,
      ),
      // showPerformanceOverlay: true, // 开启
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// int selectedIndex = 0;
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int selectedIndex = 0;

  var albumsTitleArray = [
    {
      'album': 'WESTLIFE',
      'songs': [
        'Swear It Again',
        'If I Let You Go',
        'Flying Without Wings',
        'Fool Again',
        'No No',
         'I Dont Wanna Fight',
         'Change The World',
         'Moments',
         'Seasons In The Sun',
         'I Need You',
         'Miss You',
         'More Than Words',
         'Open Your Heart',
         'Try Again',
         'What I Want Is What Ive Got',
         'We Are One',
         'Cant Lose What You Never Had'
      ],
      'intro':"Coast to Coast is the second studio album by Irish boy band Westlife. It was also the band's second album to be released as a five-piece. It was released on 6 November 2000 by RCA Records. Five hit singles were released from the album: \"Against All Odds\", \"My Love\", \"What Makes a Man\", \"I Lay My Love on You\" and \"When You're Looking Like That\". The album was a commercial success in both Ireland and the United Kingdom, selling 1.8 million copies in Britain alone. The album was the third-best selling of 2000 in Britain.\nIn January 2005, the album was re-issued in a two-in-one box set compilation with the group's third album, World of our Own.[1] A video album, entitled Coast to Coast - Up Close and Personal, was released on 27 November 2000.[2] It peaked at number one on the UK Visual Chart and a certified 3× Platinum."
    },
    {'album': 'Coast to Coast','songs': [
        'My Love',
        'What Makes A Man',
        'I Lay My Love On You',
        'I Have A Dream (Remix)',
        'Against All Odds (featuring Mariah Carey)',
        'When Youre Looking Like That',
        'Close',
        'Somebody Needs You',
        'Angels Wings',
        'Soledad',
        'Puzzle Of My Heart',
        'Dreams Come True',
        'No Place That Far',
        'Close Your Eyes',
        'You Make Me Feel',
        'Loneliness Knows Me By Name',
        'Fragile Heart',
         'Every Little Thing You Do',
         'Dont Get Me Wrong'
      ],'intro':"Coast to Coast is the second studio album by Irish boy band Westlife. It was also the band's second album to be released as a five-piece. It was released on 6 November 2000 by RCA Records. Five hit singles were released from the album: \"Against All Odds\", \"My Love\", \"What Makes a Man\", \"I Lay My Love on You\" and \"When You're Looking Like That\". The album was a commercial success in both Ireland and the United Kingdom, selling 1.8 million copies in Britain alone. The album was the third-best selling of 2000 in Britain.\nIn January 2005, the album was re-issued in a two-in-one box set compilation with the group's third album, World of our Own.[1] A video album, entitled Coast to Coast - Up Close and Personal, was released on 27 November 2000.[2] It peaked at number one on the UK Visual Chart and a certified 3× Platinum."},
    {'album': 'World of Our Own','songs':[
      'Queen Of My Heart',
      'Bop Bop Baby',
      'I Cry',
      'Uptown Girl (Radio Edit)',
       'Why Do I Love You',
       'I Wanna Grow Old With You',
       'When Youre Looking Like That (Single Remix)',
       'Evergreen',
        'World Of Our Own ',
        'To Be Loved',
        'Drive (For All Time)',
        'If Your Hearts Not In It',
        'When You Come Around',
        'Dont Say Its Too Late',
        'Dont Let Me Go',
        'Walk Away',
         'Love Crime',
         'Imaginary Diva',
         'Angel (BONUS Bad Girls)',
    ]},
    {'album': 'Unbreakable','songs':[
      'Swear It Again',
      'If I Let You Go',
      'Flying Without Wings',
      'I Have A Dream',
      'Fool Again',
      'Against All Odds (With Mariah Carey)',
      'My Love',
      'What Makes A Man',
      'Uptown Girl',
      'Queen of My Heart',
      'World of Our Own',
      'Bop Bop Baby',
      'When Youre Looking Like That',
      'Unbreakable',
      'Written In The Stars',
      'How Does It Feel'
    ]},
    {'album': 'Turnaround','songs':[
      'Mandy',
      'Hey Whatever',
      'Heal',
      'Obvious',
      'When A Woman Loves A Man',
      'On My Shoulder',
      'Turn Around',
      'I Did it For You',
      'Thank You',
      'To Be With You'
    ]},
    {'album': 'Allow Us To Be Frank','songs':[

    ]},
    {'album': 'Face To Face'},
  ];

  
  var swiperImageArray = [
    'assets/Images/banner1.jpeg',
    'assets/Images/banner2.jpeg',
    'assets/Images/banner3.jpeg',
    'assets/Images/banner4.jpeg',
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
List<Widget> buildFoodCards(){
  var songsWidget = <Widget>[];
  var albumDict = albumsTitleArray[selectedIndex];
  var songsArray = <String>[];
  songsArray = albumDict['songs'];
  var introString = albumDict['intro'];

  
  for (var i = 0; i < songsArray.length; i++) {
    var songTitle = songsArray[i];
   var widget = SongCard(
                                  title: songTitle,
                                  imageURLString:
                                      'https://img.meituan.net/msmerchant/158f48dfc20a3a94595c4fc6f96102ef3641038.jpg@600w_600h_1l',
                                  priceString: "Song \nNo."  + (i+1).toString(),
                                  starString: '⭐⭐⭐⭐⭐',
                                  introString: introString,);
       songsWidget.add(widget);                           
  }
  
  return songsWidget;
// print(songArray);


}
  List<Widget> buildAlbums() {
    var albumsWidget = <Widget>[];

    for (var i = 0; i < albumsTitleArray.length; i++) {
      var albumDict = albumsTitleArray[i];
      var albumTitle = albumDict['album'];
      var widget = GestureDetector(
        child: TabbarItem(
            albumTitle, selectedIndex == i ? Colors.red : Colors.grey),
        onTap: () {
          setState(() {
            selectedIndex = i;
            buildFoodCards();
          });
        },
      );

      albumsWidget.add(widget);
    }
    return albumsWidget;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    
    var topTextContainer = Container(
      child: Text(
        "Simple way to find Tasty Food",
        style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      ),
      margin: EdgeInsets.only(left: 15, right: 130, top: 30),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    
    return Scaffold(
      appBar: AppBar(title: Text('Cuisine')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('I ❤️ WESTLIFE'),
              accountEmail: Text('westlife@hotmail.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Images/westlife-spectrum.png"),
                    fit: BoxFit.cover),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://img.meituan.net/msmerchant/7ba8b51d8d71e254a1dfe3a2de412e19569701.jpg@600w_600h_1l')),
            ),
            ListTile(
              title: Text('UserInfo'),
              subtitle: Text('Edit UserInfo'),
              trailing: Icon(Icons.verified_user),
            ),
            ListTile(
              title: Text('Order'),
              subtitle: Text('Check Your Order'),
              trailing: Icon(Icons.history),
            ),
            Divider(
              color: Colors.grey[200],
              height: 20,
              thickness: 8,
            ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.local_dining),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              child: Column(
                children: [
                  topTextContainer,
                  Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: buildAlbums(),
                      ),
  
                    ),
                    margin: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      //  color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        VerticalDivider(width: 15),
                        Icon(Icons.today),
                        Expanded(
                            child: CupertinoTextField(
                          placeholder: 'Search Foods',
                          decoration: BoxDecoration(),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.6,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        var imageContent = Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(swiperImageArray[index]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                        return imageContent;
                      },
                      itemCount: swiperImageArray.length,
                      pagination: new SwiperPagination(),
                      layout: SwiperLayout.STACK,
                      itemWidth: MediaQuery.of(context).size.width * 0.9,
                      itemHeight: MediaQuery.of(context).size.width * 0.6,
                      autoplay: true,

                      // control: new SwiperControl(),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(

                            children: buildFoodCards(),
                            // children: <Widget>[
                            //   FoodCard(
                            //       title: 'Luxury Combo',
                            //       imageURLString:
                            //           'https://img.meituan.net/msmerchant/158f48dfc20a3a94595c4fc6f96102ef3641038.jpg@600w_600h_1l',
                            //       priceString: '¥398',
                            //       starString: '⭐⭐⭐⭐⭐'),
                            //   FoodCard(
                            //       title: 'Caviar Sushi',
                            //       imageURLString:
                            //           'https://img.meituan.net/msmerchant/56d36cd2e9021b3ece27d760b885deaa3320018.jpg@600w_600h_1l',
                            //       priceString: '¥138',
                            //       starString: '⭐⭐⭐⭐'),
                            //   FoodCard(
                            //       title: 'Tuna Sashimi',
                            //       imageURLString:
                            //           'https://img.meituan.net/msmerchant/b000b0ec4be775f5eb888f7baa0d47ba6788699.jpg@600w_600h_1l',
                            //       priceString: '¥298',
                            //       starString: '⭐⭐'),
                            //   FoodCard(
                            //     title: '🍣Salmon Sushi',
                            //     imageURLString:
                            //         'https://img.meituan.net/msmerchant/7fe88379720ad6f039d0d852c0485f6e5001003.jpg@600w_600h_1l',
                            //     priceString: '¥58',
                            //     starString: '⭐⭐⭐',
                            //   ),
                            // ],
                          ),
                        ),
                      ),
                      // Positioned(
                      //   right: 30,
                      //   bottom: 30,
                      //   child: IconButton(
                      //       icon: Icon(Icons.receipt),
                      //       onPressed: () {
                      //         showBottomSheet(
                      //             context: context,
                      //             builder: (BuildContext context) {
                      //               return Container(
                      //                   height: 200, color: Colors.lightBlue);
                      //             });

                      //         // showModalBottomSheet(context: context, builder: (BuildContext context) {
                      //         //       return Container(
                      //         //           height: 200, color: Colors.lightBlue);
                      //         //     });
                      //       }),
                      // )
                    ],
                  ),
                ],
              ),
            ),

          // ColorFiltered(colorFilter: ColorFilter.mode(Colors.blue, BlendMode.colorBurn),child: Image.asset("assets/Images/westlife-spectrum.png"),)


// Image.asset("assets/Images/westlife-spectrum.png",colorBlendMode: ColorFilter.mode(Colors.blue, BlendMode.colorBurn),)

          ],
        ),
      ),
    );
  }
}
