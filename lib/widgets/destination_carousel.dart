import 'package:flutter/material.dart';
//import 'package:travelapp/models/destination_model.dart';
import 'package:travel_app_v1/models/destination_model.dart';
import 'package:travel_app_v1/models/activity_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_v1/screens/destination_screen.dart';


class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(children: <Widget>[
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Top Destinations',

              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

          ],
        ),
      ),
      Container(
        height: 550.0,          //main container
        //color: Colors.orange,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: destinations.length,
            itemBuilder: (BuildContext conext, int index){
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: ()=>Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_)=>DestinationScreen(
                      destination: destination,
                    ),
                  ),
                ),
                child: Container(                       //destination photos
                  margin: const EdgeInsets.all(5.0),
                  width: 510.0,
                  //color: Colors.red,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom:1.0,
                        child: Container(  //container around the picture
                          height: 500.0,
                          width: 380.0,


                          decoration:
                          BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                        ),
                      ),
                      Container(decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(0.0,2.0),
                          blurRadius: 6.0,

                        ),
                        ],
                      ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag:destination.imageUrl,
                              child: ClipRRect(
                                borderRadius:BorderRadius.circular(20.0),
                                child: Image(height: 180.0,
                                  width: 560.0,
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination.city,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,

                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.locationArrow,
                                        size: 10.0,
                                        color:Colors.white,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        destination.country,
                                        style: TextStyle(
                                          color: Colors.white,

                                        ),),
                                    ],
                                  ),


                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      )
    ],
    );
  }
}

