import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChefPage extends StatefulWidget {
  @override
  _ChefState createState() => _ChefState();
}

class _ChefState extends State<ChefPage> {
  @override
  Widget _buildBox(String img, String name) {
    return new Container(
      constraints: new BoxConstraints.expand(
        height: 300.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.grey,
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        image: new DecorationImage(
          image: new AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondScreen(name: name)));
            },
            icon: Icon(Icons.add),
            color: Colors.white,
            iconSize: 50,
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Chef \u2019s Menu'),
            ),
            body: new Container(
                margin: new EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 10.0,
                ),
                child: GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  children: [
                    _buildBox('assets/chef1.png', 'Egg Salad'),
                    _buildBox('assets/chef2.png', 'Fruit Sandwich'),
                    _buildBox('assets/chef3.png', 'Low Calory Pasta'),
                    _buildBox('assets/chef4.png', 'Chicken Steak'),
                    _buildBox('assets/chef5.png', 'Barbecue Corns'),
                  ],
                ))));
  }
}

class SecondScreen extends StatefulWidget {
  final String name;

  SecondScreen({Key key, @required this.name}) : super(key: key);
  // This widget is the root of your application.
  @override
  _SecondState createState() => new _SecondState(name);
}

class _SecondState extends State<SecondScreen> {
  String name;
  _SecondState(String name) {
    this.name = name;
  }
  var _mealType = 'select your meal';
  var mealTypes = ['Breakfast', 'Lunch', 'Dinner'];

  DateTime nowDate = DateTime.now();
  DateTime _dateTime = DateTime.now();

  // This widget is the root of your application.
  void initState() {
    _mealType = 'select';
  }

  void changeType(int index) {
    setState(() {
      _mealType = mealTypes[index];
    });
  }

  void _showDatePicker() {
    _selectDate(context);
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime _picked = await showDatePicker(
      context: context,
      initialDate: nowDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    if (_picked != null) {
      setState(() {
        _dateTime = _picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text('Add Meal Plan')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  'Name                                 ',
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(name,
                    style: new TextStyle(
                      fontSize: 20.0,
                    ))
              ],
            ),
            height: 70,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  'Date                                          ',
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                TextButton(
                    child: Text(_dateTime.toString().substring(0, 10),
                        style: new TextStyle(
                          fontSize: 18.0,
                        )),
                    onPressed: () {
                      _showDatePicker();
                    })
              ],
            ),
            height: 70,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  'GHGs                                                      ',
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text('303g',
                    style: new TextStyle(
                      fontSize: 20.0,
                    ))
              ],
            ),
            height: 70,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  'Calories                                               ',
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text('170cal',
                    style: new TextStyle(
                      fontSize: 20.0,
                    ))
              ],
            ),
            height: 70,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  'Recipe',
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            height: 70,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            alignment: Alignment.center,
            child: Row(children: [
              Text(
                'Meal Type                                      ',
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CupertinoPicker(
                          itemExtent: 40.0,
                          children: [
                            Text('Breakfast'),
                            Text('Lunch'),
                            Text('Dinner')
                          ],
                          onSelectedItemChanged: (index) {
                            changeType(index);
                          },
                        );
                      },
                    );
                  },
                  child: Text(_mealType,
                      style: new TextStyle(
                        fontSize: 20.0,
                      ))),
            ]),
            height: 70,
          ),
          ElevatedButton(
            child: Text('Add to Plan',
                style: new TextStyle(
                  fontSize: 20.0,
                )),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}
