import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String backgroundImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$backgroundImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,160.0,0.0,0.0),
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                       'location': result['location'],
                       'flag': result['flag'],
                       'time': result['time'],
                       'isDayTime': result['isDayTime'],
                     };
                   });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[200],
                  ),
                  label: Text(
                    'Choose Location',
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                  ),
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2,
                      color: Colors.grey[200],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Text(data['time'],
              style: TextStyle(
                fontSize: 68.0,
                letterSpacing: 2,
                color: Colors.grey[200],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
