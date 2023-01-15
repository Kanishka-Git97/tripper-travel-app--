//import 'package:travelapp/models/activity_model.dart';
import 'package:travel_app_v1/models/activity_model.dart';
class Destination{
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;
  String price;
  double rating;
  String article;
  String article_title;

  Destination({

    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
    required this.price,
    required this.rating,
    required this.article,
    required this.article_title,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl:'assets/images/basilica.jpg',
    name:'St. Mark\'s Basilica',
    type:'Sightseeing tour',
    startTimes:['9.00 am', '11.00 pm'],
    rating:5,
    price:30,
  ),

  Activity(
    imageUrl:'assets/images/basilica.jpg',
    name:'St. Mark\'s Basilica',
    type:'Sightseeing tour',
    startTimes:['9.00 am', '11.00 pm'],
    rating:5,
    price:30,
  ),

  Activity(
    imageUrl:'assets/images/denmark.jpg',
    name:'Denmark',
    type:'Sightseeing tour',
    startTimes:['9.00 am', '11.00 pm'],
    rating:4,
    price:130,
  ),

  Activity(
    imageUrl:'assets/images/france.jpg',
    name:'France',
    type:'Sightseeing tour',
    startTimes:['10.00 am', '11.00 pm'],
    rating:6,
    price:930,
  ),

];

List<Destination> destinations=[
  Destination(
    imageUrl: 'assets/images/venice.jpg',
    city:'Venice',
    country:'Italy',
    description:'Visit venice for amazing and unforgettable experience',
    activities:activities,
    price:'580',
    rating: 5.0,
    article_title: 'The City of Canals',
    article: 'stry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
        ' recently with desktop publishing software like Aldus PageMaker including versions standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
        ' recently with desstandard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
        ' recently with desktop publishing software like Aldus PageMaker including ktop publishing software like Aldus PageMaker including standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
        ' recently with desktop publishing software like Aldus PageMaker including of Lorem Ipsum.'


  ),

  Destination(
    imageUrl: 'assets/images/london.jpg',
    city:'London',
    country:'England',
    description:'Visit venice for amazing and unforgettable experience',
    activities:activities,
    price: '478',
    rating: 4.0,
    article_title: 'Greater London',
    article: 'stry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
          ' recently with desktop publisstandard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
          ' recently with desktop publishing software like Aldus PageMaker including hing software like standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
      ' recently with desktop publishing software like Aldus PageMaker including Aldus PageMaker including versions of Lorem Ipsum.standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
      ' recently with desktop publishing software like Aldus PageMaker including '


  ),
  Destination(
    imageUrl: 'assets/images/new york.jpg',
    city:'New York',
    country:'USA',
    description:'Visit venice for amazing and unforgettable experience',
    activities:activities,
    price: '503',
    rating: 3.0,
    article_title: 'The Big Apple',
    article: 'stry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
          ' recently with desktop publishing software like Aldus PageMaker including versions standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
      ' recently with desktop publishing software like Aldstandard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
      ' recently with desktop publishing software like Aldus PageMaker including us PageMaker including of Lorem Ipsum.'
  ),


  Destination(
      imageUrl: 'assets/images/indonesia.jpg',
      city:'Bali',
      country:'Indonesia',
      description:'Visit venice for amazing and unforgettable experience',
      activities:activities,
      price: '503',
      rating: 3.0,
      article_title: 'Ancient Temples',
      article: 'stry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
          ' recently with desktop publishing software like Aldus PageMaker including versions standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
          ' recently with desktop publishing software like Aldstandard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more'
          ' recently with desktop publishing software like Aldus PageMaker including us PageMaker including of Lorem Ipsum.'
  ),
];



