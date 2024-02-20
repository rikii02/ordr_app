import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ordr_app/cards/people_card.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  List<Map<String, dynamic>> profileInfo = [];

  @override
  void initState() {
    super.initState();
    loadProfileInfo();
  }

  Future<void> loadProfileInfo() async {
    try {
      final String data =
          await rootBundle.loadString('assets/data/people_info.json');
      final dynamic jsonData = json.decode(data);

      if (jsonData is Map<String, dynamic>) {
        setState(() {
          profileInfo = [jsonData];
        });
      } else {
        print('Profile JSON is not a map.');
      }
    } catch (e) {
      print('Error loading profile data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F4F2),
        toolbarHeight: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                // Add logic to open the side menu here
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.menu, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Show UserProfileCard for the loaded profile
            if (profileInfo.isNotEmpty)
              UserProfileCard(
                name: profileInfo[0]['name'] ?? '',
                nameId: profileInfo[0]['name_id'] ?? '',
                mainImageUrl: profileInfo[0]['mainImageUrl'] ?? '',
                status: profileInfo[0]['status'] ?? '',
                reviews: List<Map<String, dynamic>>.from(
                        profileInfo[0]['reviews'] ?? []) ??
                    [],
                lastOrders: profileInfo[0]['lastOrders'] ?? '',
              ),
            if (profileInfo.isEmpty)
              Center(child: CircularProgressIndicator()), // Show a loading indicator while data is being loaded
          ],
        ),
      ),
    );
  }
}
