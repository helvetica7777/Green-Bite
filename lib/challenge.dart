import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<ChallengePage> {
  @override
  Widget _buildBox1() {
    return new Container(
      constraints: new BoxConstraints.expand(
        height: 300.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.grey,
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        image: new DecorationImage(
          image: new AssetImage("assets/cha1.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text('October Vegetarian Challenge',
                  style: new TextStyle(
                      fontSize: 47.0,
                      color: Colors.white,
                      fontStyle: FontStyle.italic))),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Challenge1()));
            },
            icon: Icon(Icons.arrow_right_alt_outlined),
            color: Colors.white,
            iconSize: 50,
          )
        ],
      ),
    );
  }

  @override
  Widget _buildBox2() {
    return new Container(
      constraints: new BoxConstraints.expand(
        height: 300.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.grey,
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        image: new DecorationImage(
          image: new AssetImage("assets/cha2.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text('Chef Marcus\u2019 Low Carbon Footprint Challenge',
                  style: new TextStyle(
                      fontSize: 47.0,
                      color: Colors.white,
                      fontStyle: FontStyle.italic))),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Challenge1()));
            },
            icon: Icon(Icons.arrow_right_alt_outlined),
            color: Colors.white,
            iconSize: 50,
          )
        ],
      ),
    );
  }

  Widget _buildBox3() {
    return new Container(
      constraints: new BoxConstraints.expand(
        height: 300.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.grey,
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        image: new DecorationImage(
          image: new AssetImage("assets/cha3.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text('3-Months 30,000g GHGs Reducing Challenge',
                  style: new TextStyle(
                      fontSize: 47.0,
                      color: Colors.white,
                      fontStyle: FontStyle.italic))),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Challenge1()));
            },
            icon: Icon(Icons.arrow_right_alt_outlined),
            color: Colors.white,
            iconSize: 50,
          )
        ],
      ),
    );
  }

  Widget _buildBox4() {
    return new Container(
      constraints: new BoxConstraints.expand(
        height: 300.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.grey,
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        image: new DecorationImage(
          image: new AssetImage("assets/cha4.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text('Join Talan\u2019s Kitchen',
                  style: new TextStyle(
                      fontSize: 47.0,
                      color: Colors.white,
                      fontStyle: FontStyle.italic))),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Challenge1()));
            },
            icon: Icon(Icons.arrow_right_alt_outlined),
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
                    _buildBox1(),
                    _buildBox2(),
                    _buildBox3(),
                    _buildBox4(),
                  ],
                ))));
  }
}

class Challenge1 extends StatefulWidget {
  @override
  _Cha1State createState() => _Cha1State();
}

class _Cha1State extends State<Challenge1> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Challenge')),
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
                child: Column(
                  children: [
                    Image.asset("assets/cha1.png"),
                    Text(
                      '31 days left',
                      style: new TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text('October Vegetarian Challenge',
                        style: new TextStyle(
                          fontSize: 20.0,
                        ))
                  ],
                ),
              )
            ])));
  }
}
