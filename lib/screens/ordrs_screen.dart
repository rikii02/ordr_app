import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ordr_app/cards/lastordrs_card.dart';
import 'package:ordr_app/screens/profile_screen.dart';

class OrdrsScreen extends StatefulWidget {
  const OrdrsScreen({Key? key}) : super(key: key);

  @override
  _OrdrsScreenState createState() => _OrdrsScreenState();
}

class _OrdrsScreenState extends State<OrdrsScreen> {
  late Map<String, dynamic> profileInfo;

  @override
  void initState() {
    super.initState();
    loadProfileInfo();
  }

  Future<void> loadProfileInfo() async {
    try {
      final String data =
          await rootBundle.loadString('assets/data/profile_info.json');
      final dynamic jsonData = json.decode(data);

      if (jsonData is Map<String, dynamic>) {
        setState(() {
          profileInfo = jsonData;
        });
      } else {
        print('JSON is not a map.');
      }
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F4F2),
        toolbarHeight: 1, // Adjust the height of the AppBar
        elevation: 0, // Remove the shadow of the AppBar
      ),
      body: profileInfo != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile image and name
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            AssetImage(profileInfo['mainImageUrl']),
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(profileInfo['name'],
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Text(profileInfo['name_id'],
                              style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Title "Last Ordrs"
                  const Text(
                    'Last Ordrs',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Last Ordrs card (using the imported widget)
                  LastOrdrsCard(
                    placeName: profileInfo['lastOrders'],
                    rating: profileInfo['reviews'][0]['rating'],
                    comment: profileInfo['reviews'][0]['comment'],
                  ),
                  // You can add logic here to display information about the last orders
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
