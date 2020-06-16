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
      title: 'Westlife',
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
      home: MyHomePage(title: 'Westlife Home Page'),
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
      'intro':"Coast to Coast is the second studio album by Irish boy band Westlife. It was also the band's second album to be released as a five-piece. It was released on 6 November 2000 by RCA Records. Five hit singles were released from the album: \"Against All Odds\", \"My Love\", \"What Makes a Man\", \"I Lay My Love on You\" and \"When You're Looking Like That\". The album was a commercial success in both Ireland and the United Kingdom, selling 1.8 million copies in Britain alone. The album was the third-best selling of 2000 in Britain.\nIn January 2005, the album was re-issued in a two-in-one box set compilation with the group's third album, World of our Own.[1] A video album, entitled Coast to Coast - Up Close and Personal, was released on 27 November 2000.[2] It peaked at number one on the UK Visual Chart and a certified 3× Platinum.",
      'albumImage':'assets/Images/coasttocoast.jpg',
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
      ],'intro':"Coast to Coast is the second studio album by Irish boy band Westlife. It was also the band's second album to be released as a five-piece. It was released on 6 November 2000 by RCA Records. Five hit singles were released from the album: \"Against All Odds\", \"My Love\", \"What Makes a Man\", \"I Lay My Love on You\" and \"When You're Looking Like That\". The album was a commercial success in both Ireland and the United Kingdom, selling 1.8 million copies in Britain alone. The album was the third-best selling of 2000 in Britain.\nIn January 2005, the album was re-issued in a two-in-one box set compilation with the group's third album, World of our Own.[1] A video album, entitled Coast to Coast - Up Close and Personal, was released on 27 November 2000.[2] It peaked at number one on the UK Visual Chart and a certified 3× Platinum.",
      'albumImage':'assets/Images/coasttocoast.jpg',
      },
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
    ],
    'albumImage':'assets/Images/worldofourown.jpg',
    'intro':'World of Our Own is the third studio album recorded by Irish boy band Westlife. It was released through RCA Records on 1 November 2001. This is their third album release under RCA and Sony Music. It was also the band\'s third album to be released as a five-piece. It reached number one in the United Kingdom and includes the singles "Queen of My Heart" (which was a double A-side with "When You\'re Looking Like That"), "World of Our Own" (which was a double A-side with "Angel"), "Bop Bop Baby", and the final single from the group\'s last album, "Uptown Girl". "Evergreen" was later covered by Will Young as his winner\'s single for the 2002 Pop Idol competition. It is their first album to have a title track.\nThe album went 4x Platinum in the UK and is currently the fourteenth biggest selling boy band album ever in the UK.[2] In January 2005, the album was re-released in a 2-in-1 box set with the group\'s previous album, Coast to Coast.[3]'
    },
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
    ],'albumImage':'assets/Images/unbreakable.jpg',
    'intro':'Unbreakable – The Greatest Hits Volume 1 is the first greatest hits album by Irish boy band Westlife. The album was released on 11 November 2002. It was also the band\'s fourth album to be released as a five-piece and with RCA Records and Sony BMG. The album consists of all of the group\'s past singles, along with six new songs. Hit single "Flying Without Wings" was re-recorded as a duet with South Korean singer BoA and Mexican singer Cristian Castro, and each respective duet was included on the Asian and Spanish editions of the album respectively. The first single released from the album was "Unbreakable", a UK number-one single. The second single, the double A-side "Tonight" / "Miss You Nights" peaked at number three in the UK and at number one in the Republic of Ireland.\nUnbreakable peaked at number one in the UK and sold close to 1.8 million copies in the UK alone. The album was the ninth best-selling album of 2002 in the UK. It is also the band\'s biggest selling album so far and their longest charting album. It managed to re-enter the year-end albums chart of 2007 at number 107. In October 2008, IFPI announced that the album was certified 2x Platinum, exceeding two million sales in Europe. On the year-end album charts of 2008, the album re-entered at number 79 with 191,000 copies sold within the year. The album spent 55 weeks on the UK Top 100 Albums chart.[1] This is the fifth best-selling album of 2002 in Ireland.\nIn 2008, the album was re-issued in an exclusive two disc edition, entitled "Unbreakable: The Greatest Hits - 2008 NZ Tour Edition". The package featured the album, with the same track listing, plus the "Live at Wembley" 2006 concert DVD. It peaked at No. 1 on the albums chart there, and achieved 2x Platinum status, with more than 30,000 copies sold. The album finished at No. 19 on the 2008 New Zealand Year-end charts.'
    
    },
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
    ],'albumImage':'assets/Images/turnaround.jpg',
    'intro':'Turnaround is the fifth studio album by Irish boy band Westlife, released on 24 November 2003 by BMG. It was also the band\'s fifth album to be released as a five-piece and with RCA Records and Sony BMG. The first single released was the upbeat track, "Hey Whatever". The next single was a cover of the Barry Manilow hit, "Mandy". The band\'s version earned them their 12th UK number one and an Irish record of the year award. "Obvious", an original song, was the third and final single released from the album.\nTurnaround was also the last album to be recorded with their full original lineup with member Brian McFadden, who leaves the band in March the following year. The album was the 23rd best selling album of 2003 in the UK. The album was re-released in a box set on 25 January 2005 with their debut album, Westlife. The album received favourable reviews from music critics, while it attained commercial success, topping the UK and Ireland charts, while reaching the top-ten in many countries.'
    },
    {'album': 'Allow Us To Be Frank','songs':[
    'Aint That A Kick In The Head',
    'Fly Me',
    'Smile',
    'Let There Be Love',
    'The Way You Look Tonight (feat Joanne Hindley) ',
    'Come Fly With Me',
    'Mack The Knife',
    'I Left My Heart In San Francisco',
    'Summer Wind',
    'Clementine',
    'When I Fall In Love',
    'Moon River',
    ],
    'intro':'...Allow Us to Be Frank, a Rat Pack tribute, is the sixth studio album, sixth major album release under Sony BMG and first cover album by Irish boy band Westlife; it is also the first album since the departure of Bryan McFadden and as a four-piece. It was released on 8 November 2004, and peaked at number two in Ireland and number three in the United Kingdom. ...Allow Us To Be Frank was number twenty-four on the 2004 year-end album charts. The album features songs made popular by Frank Sinatra such as "The Way You Look Tonight", "Come Fly with Me", "Moon River", "Summer Wind" and "That\'s Life". It also includes the Nat "King" Cole song, "When I Fall in Love". It was recorded with a 60-piece orchestra at Phoenix Studios in Wembley, in the London Borough of Brent.','albumImage':'assets/Images/allowustobefrank.jpg'},


    {'album': 'Face To Face','songs':[
    'You Raise Me Up',
    'When You Tell Me That You Love Me (FDiana Ross)',
    'Amazing',
    'Thats Where You Find Love',
    'Shes Back ',
    'Desperado',
    'Colour My World',
    'In This Life',
    'Heart Without A Home',
    'Hit You With The Real Thing',
    ],
    'intro':'Face to Face is the seventh studio album by Irish boy band Westlife and it was released in the UK on 31 October 2005. The album contains pop songs and some dance oriented tracks. It was also the band\'s second album to be released as a four-piece. It was also the band\'s seventh album release under RCA Records and Sony BMG.\nThe album was also released on DualDisc in the UK, which included the videos of the making of "You Raise Me Up", the Face to Face album photoshoot and exclusive interview footage.[5]\nThe album includes a cover of "She\'s Back" by Human Nature, "Desperado" by the Eagles, Collin Raye\'s number one hit "In This Life", and a Nick Carter solo song, "Heart Without a Home".The album had more than 10,000 legal copies sold in mainland China.[6]',
    'albumImage':'assets/Images/facetoface.jpg'},
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
  var albumImage = albumDict['albumImage'];
  var albumNameString = albumDict['album'];
  for (var i = 0; i < songsArray.length; i++) {
    var songTitle = songsArray[i];
   var widget = SongCard(
                                  title: songTitle,
                                  imageURLString:
                                      albumImage,
                                  priceString: "Song \nNo."  + (i+1).toString(),
                                  starString: '⭐⭐⭐⭐⭐',
                                  introString: introString,albumNameString: albumNameString,);
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
        "WESTLIFE We Never Say Goodbye",
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
      appBar: AppBar(title: Text('Westlife')),
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
                  backgroundImage: AssetImage("assets/Images/bryan.jpg")),
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
                          placeholder: 'Search Songs',
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
