import 'package:flutter/material.dart';
import 'package:shubrafaculty/History_Page_forUser.dart';
import 'package:shubrafaculty/add_request_page.dart';
import 'package:shubrafaculty/place_of_problem.dart';
import 'package:shubrafaculty/profile_page.dart';
import 'package:shubrafaculty/radio_button.dart';
import 'package:shubrafaculty/show%20request.dart';

class MainPage extends StatefulWidget{
  static const String FacultyName = 'NavBar' ;

  @override
  _MainPageState createState() => _MainPageState() ;


}

class _MainPageState extends State<MainPage>{

  int index = 1;
  final screens = [
    ProfilePage(),
    AddRequest(),
    HistoryPageUser(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.blue,
      // indicatorColor : Color.fromRGBO(46, 64, 83, 1) ,
        labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
    ),

      child :NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        height: 80,
        backgroundColor: Colors.white,
        selectedIndex: index,
        onDestinationSelected: (index) =>
        setState(()=>this.index=index),
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
           selectedIcon: Icon(Icons.home),
              label: 'home'),
          NavigationDestination(icon: Icon(Icons.add_a_photo_outlined), selectedIcon: Icon(Icons.add) , label: 'add request'),
          NavigationDestination(icon: Icon(Icons.list_alt_outlined), selectedIcon: Icon(Icons.list) , label: 'list')
        ],
      ),
      )
    );
  }
  
  
}