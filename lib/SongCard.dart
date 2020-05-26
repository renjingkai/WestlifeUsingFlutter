

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detail.dart';

class SongCard extends StatelessWidget {
  var title;
  var imageURLString;
  var priceString;
  var starString;
  var introString;
   SongCard({this.title,this.imageURLString,this.priceString,this.starString,this.introString});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Positioned(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(15)),
              width: 160,
              height: 240,
              margin: EdgeInsets.only(left: 20, top: 30),
            )),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(60),
                  //  boxShadow: [BoxShadow(
                  //    color:Color.fromRGBO(255, 212, 200, 1),
                  //    offset:Offset(3,3),
                  //    blurRadius:5,
                  //    spreadRadius:5,
                  //  )],
                ),
              ),
              width: 120,
              height: 120,
              left: 17,
              top: 17,
            ),
            Positioned(
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      '$imageURLString')),
              width: 120,
              height: 120,
              left: 10,
              top: 10,
            ),
            Positioned(
              child: Text(
                '$priceString',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              left: 135,
              top: 77.5,
            ),
            Positioned(
              child: Text(
                '$title',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              left: 40,
              top: 150,
            ),
            
//The following SocketException was thrown resolving an image codec
            Positioned(
              child: Text(
                '$introString',
                style: TextStyle(fontSize: 13, color: Colors.grey),
                textAlign: TextAlign.left,
                maxLines: 3,
              ),
              left: 40,
              top: 180,
              height: 60,
              width: 140,
            ),
            Positioned(
              child: Text(
                starString,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              left: 40,
              top: 237,
            ),
          ],
        ),
      ),
      onTap: () {
        // Navigator.push<Map>(context, MaterialPageRoute(builder: (ctx) {
        //   var detailPage = DetailPage(title:title,starString: starString,imageURLString: imageURLString,priceString: priceString,);
        //   // detailPage.otherP = 'hahaha';
          
        //   return detailPage;
        // },
       
        // ));


        //  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        //   var detailPage = DetailPage(title:title,starString: starString,imageURLString: imageURLString,priceString: priceString,);
        //   // detailPage.otherP = 'hahaha';
          
        //   return detailPage;

   
          
        // },
       

     
      
           Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      
         
          return DetailPage(title:title,starString: starString,imageURLString: imageURLString,numberString: priceString,descString: introString,);
        })).then((v){
          print(v);
        });
     



      },
    );
  }
}

class CircleClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    print(size);
    return Rect.fromLTWH(0,0, 180, 180);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}