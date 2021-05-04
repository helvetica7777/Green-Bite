import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<CalendarPage> {
  void handleNewDate(date) {
    print("handleNewDate ${date}");
    setState(() {
      _selectedDay = date;
      _selectedPlans = _getEventsfromDay(date);
      _controllerB = TextEditingController.fromValue(
          TextEditingValue(text: _selectedPlans[0]));
      _controllerL = TextEditingController.fromValue(
          TextEditingValue(text: _selectedPlans[1]));
      _controllerD = TextEditingController.fromValue(
          TextEditingValue(text: _selectedPlans[2]));
    });
  }

  TextEditingController _controllerB;
  TextEditingController _controllerL;
  TextEditingController _controllerD;

  DateTime _selectedDay = DateTime.now();

  Map<DateTime, List> _plans = {};
  List _data = ['', '', ''];

  List _selectedPlans = [];

  void initState() {
    _plans = {};
    super.initState();
    _controllerB = TextEditingController();
    _controllerL = TextEditingController();
    _controllerD = TextEditingController();
  }

  void dispose() {
    _controllerB.dispose();
    _controllerL.dispose();
    _controllerD.dispose();
    super.dispose();
  }

  void _addEvent() async {
    if (_plans[_selectedDay] != null) {
      _plans[_selectedDay].add(
        _data,
      );
    } else {
      _plans[_selectedDay] = _data;
    }
  }

  List _getEventsfromDay(DateTime date) {
    if (_plans[date] == null) {
      return ['', '', ''];
    } else
      return _plans[date];
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plan'),
        ),
        body: new Container(
          margin: new EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 10.0,
          ),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new Calendar(
                onDateSelected: (date) => handleNewDate(date),
                isExpandable: true,
              ),
              new Divider(
                height: 50.0,
              ),
              new Text('Breakfast'),
              new TextField(
                controller: _controllerB,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 3),
                  ),
                ),
                onChanged: (value) {
                  _data[0] = value;
                  _addEvent();
                },
              ),
              new Text('Lunch'),
              new TextField(
                controller: _controllerL,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 3),
                  ),
                ),
                onChanged: (value) {
                  _data[1] = value;
                  _addEvent();
                },
              ),
              new Text('Dinner'),
              new TextField(
                controller: _controllerD,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 3),
                  ),
                ),
                onChanged: (value) {
                  _data[2] = value;
                  _addEvent();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
