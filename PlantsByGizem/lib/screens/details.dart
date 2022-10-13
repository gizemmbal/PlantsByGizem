import 'package:flutter/material.dart';
import 'package:ninja_trips/models/Plant.dart';
import 'package:ninja_trips/shared/heart.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class Details extends StatelessWidget {
  final Plant plant;
  Details({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey[600],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // actions: [
          //   PopupMenuButton(

          //       onSelected: (value) {
          //         //if (value == MenuItem.item1) {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => SignIn(),
          //           ),
          //         );
          //         //}
          //       },
          //       itemBuilder: (context) => const [
          //             PopupMenuItem(
          //               //value: MenuItem.item ,
          //               child: Text('logout'),
          //             ),
          //           ]),
          // ],
        ),
        //extendBodyBehindAppBar: true,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                  child: Image.asset(
                'images/${plant.img}',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )),
              SizedBox(height: 10),
              ListTile(
                  title: Text(plant.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[800])),
                  subtitle: Text('${plant.difficulty} difficulty to grow, price:${plant.price}\₺',
                      style: TextStyle(letterSpacing: 1)),
                  trailing: Heart()),
              Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(lipsum.createText(numParagraphs: 1, numSentences: 3),
                      style: TextStyle(color: Colors.grey[600], height: 1.4))),
            ],
          ),
        ));
  }
}
