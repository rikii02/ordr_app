import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:ordr_app/cards/Oplace_card.dart';
import 'package:ordr_app/screens/chat_screen.dart';
import 'package:ordr_app/screens/ordrs_screen.dart';
import 'package:ordr_app/screens/people_screen.dart';
import 'package:ordr_app/screens/profile_screen.dart';

class OPlacesScreen extends StatefulWidget {
  @override
  _OPlacesScreenState createState() => _OPlacesScreenState();
}

class _OPlacesScreenState extends State<OPlacesScreen> {
  late Map<String, dynamic> placesData;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    loadPlacesData();
  }

  Future<void> loadPlacesData() async {
    try {
      final String data =
          await rootBundle.loadString('assets/data/business_info.json');
      final dynamic jsonData = json.decode(data);

      if (jsonData is Map<String, dynamic>) {
        setState(() {
          placesData = jsonData;
        });
      } else {
        print('JSON is not a map.');
      }
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 244, 242, 1),
      appBar: _selectedIndex == 0
          ? AppBar(
              title: const Text('OPlaces Screen'),
              backgroundColor: const Color.fromRGBO(247, 244, 242, 1),
              actions: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.grey,
                    onPressed: () {
                      // Add logic to open the side menu here
                    },
                  ),
                ),
              ],
            )
          : null,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ListView(
            children: [
              OPlaceCard(
                name: placesData['name'],
                nameId: placesData['name_id'],
                status: placesData['status'],
                otags: List<String>.from(placesData['otags']),
                mainImageUrl: placesData['images']['main'],
                otherImages:
                    List<String>.from(placesData['images']['other']),
                reviews: List<Map<String, dynamic>>.from(placesData['reviews']),
                users: List<Map<String, dynamic>>.from(placesData['users']),
              ),
            ],
          ),
          OrdrsScreen(),
          PeopleScreen(),
          ChatScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'OPlaces',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Ordrs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
