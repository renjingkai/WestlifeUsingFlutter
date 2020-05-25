import 'package:awesome/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FoodCard.dart';
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
  var swiperImageArray = [
    'https://img.meituan.net/msmerchant/284c6c89e1a975d14bfb311b588772dc369418.jpg@600w_600h_1l',
    'https://img.meituan.net/msmerchant/3a373be670fd8db23d5c461d810b5407574589.jpg@600w_600h_1l',
    'https://img.meituan.net/msmerchant/2d7ab4b84febc3a932632d2d47be6b232610701.jpg@600w_600h_1l',
    'https://img.meituan.net/msmerchant/2879f36120fee49a96bc937789536c433359502.jpg@600w_600h_1l',
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
              accountName: Text('张亮Joejoe'),
              accountEmail: Text('Joejoe@hotmail.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img.meituan.net/msmerchant/82e9ad59c5804de5c1eb8fc3cdca91e2686273.jpg@600w_600h_1l'),
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
                        children: <Widget>[
                          GestureDetector(
                            child: TabbarItem('Asain Food',
                                selectedIndex == 0 ? Colors.red : Colors.grey),
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                          ),
                          GestureDetector(
                            child: TabbarItem('Western Food',
                                selectedIndex == 1 ? Colors.red : Colors.grey),
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                          ),
                          GestureDetector(
                            child: TabbarItem('Indian Food',
                                selectedIndex == 2 ? Colors.red : Colors.grey),
                            onTap: () {
                              setState(() {
                                selectedIndex = 2;
                              });
                            },
                          ),
                        ],
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
                                image: NetworkImage(swiperImageArray[index]),
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
                            children: <Widget>[
                              FoodCard(
                                  title: 'Luxury Combo',
                                  imageURLString:
                                      'https://img.meituan.net/msmerchant/158f48dfc20a3a94595c4fc6f96102ef3641038.jpg@600w_600h_1l',
                                  priceString: '¥398',
                                  starString: '⭐⭐⭐⭐⭐'),
                              FoodCard(
                                  title: 'Caviar Sushi',
                                  imageURLString:
                                      'https://img.meituan.net/msmerchant/56d36cd2e9021b3ece27d760b885deaa3320018.jpg@600w_600h_1l',
                                  priceString: '¥138',
                                  starString: '⭐⭐⭐⭐'),
                              FoodCard(
                                  title: 'Tuna Sashimi',
                                  imageURLString:
                                      'https://img.meituan.net/msmerchant/b000b0ec4be775f5eb888f7baa0d47ba6788699.jpg@600w_600h_1l',
                                  priceString: '¥298',
                                  starString: '⭐⭐'),
                              FoodCard(
                                title: '🍣Salmon Sushi',
                                imageURLString:
                                    'https://img.meituan.net/msmerchant/7fe88379720ad6f039d0d852c0485f6e5001003.jpg@600w_600h_1l',
                                priceString: '¥58',
                                starString: '⭐⭐⭐',
                              ),
                            ],
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
          ],
        ),
      ),
    );
  }
}
