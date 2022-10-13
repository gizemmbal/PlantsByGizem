import 'package:flutter/material.dart';
import 'package:ninja_trips/models/Plant.dart';
import 'package:ninja_trips/screens/details.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  List<Widget> _plantTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addplants();
  }

  void _addplants() {
    // get data from db
    List<Plant> _plants = [
      Plant(title: 'alocasia', price: '350', difficulty: '3/10', img: 'alocasia.jpg'),
      Plant(title: 'ficus_elastica', price: '400', difficulty: '5/10', img: 'ficus_elastica.jpg'),
      Plant(title: 'ficus_lyrata', price: '600', difficulty: '4/10', img: 'ficus_lyrata.jpg'),
      Plant(title: 'monstera', price: '750', difficulty: '2/10', img: 'monstera.jpg'),
      Plant(title: 'nephrolepis', price: '750', difficulty: '2/10', img: 'nephrolepis.jpg'),
      Plant(title: 'pilea', price: '750', difficulty: '2', img: 'pilea.jpg'),
      Plant(title: 'pothos_golden', price: '750', difficulty: '2/10', img: 'pothos_golden.jpg'),
      Plant(title: 'pothos_neon', price: '750', difficulty: '2/10', img: 'pothos_neon.jpg'),
      Plant(title: 'sansevieria', price: '750', difficulty: '2', img: 'sansevieria.jpg'),
      Plant(title: 'zamioculcas', price: '750', difficulty: '2/10', img: 'zamioculcas.jpg'),
    ];

    _plants.forEach((Plant plant) {
      _plantTiles.add(_buildTile(plant));
    });
  }

  Widget _buildTile(Plant plant) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(plant: plant)));
      },
      contentPadding: EdgeInsets.all(15.0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${plant.difficulty} difficulty',
              style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 50, 109, 52))),
          Text(plant.title, style: TextStyle(fontSize: 20, color: Colors.grey[700])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'images/${plant.img}',
          height: 60.0,
        ),
      ),
      trailing: Text('${plant.price}\₺'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _plantTiles.length,
        itemBuilder: (context, index) {
          return _plantTiles[index];
        });
  }
}
