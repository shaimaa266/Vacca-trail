
import 'package:app_vacca/cow_data/cow_feature.dart';
import 'package:app_vacca/home/home_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;
  List<Widget>paths=[MYhOME(),CowFeature()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey, blurRadius: 4),
        ],
      ),
      child: BottomNavigationBar(
        iconSize: 30,
        currentIndex: selectedIndex,
        selectedFontSize: 17,
        unselectedFontSize: 15,
        selectedItemColor: Color(0xff185C30),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Image.asset(
                "assets/images/home.png",
                width: 50,
                height: 50,
                color: selectedIndex == 0 ? Color(0xff185C30) : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  selectedIndex=0;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>paths[selectedIndex]));
              },
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex=1;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>paths[selectedIndex]));
              },
              child: Image.asset(
                "assets/images/nav bar cow icon.png",
                width: 80,
                height: 50,
                color: selectedIndex == 1 ? Color(0xff185C30) : Colors.grey,
              ),
            ),
            label: "Cows",
          ),
          BottomNavigationBarItem(
            label: "Setting",
            icon: IconButton(
              icon: Icon(
                Icons.settings,
              ),
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (_)=>Settings()));
              },
            ),
          )
        ],
      ),
    );
  }
}
