import 'package:flutter/material.dart';

class CurvedNavBar extends StatefulWidget {
  @override
  _CurvedNavBarState createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                color: _currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                color: _currentIndex == 2 ? Colors.blue : Colors.grey,
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
                color: _currentIndex == 3 ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Icon(
            Icons.circle,
            size: 12,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

