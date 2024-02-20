import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        elevation: 0,
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
                          Text(
                            profileInfo['name'],
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            profileInfo['name_id'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Logic for the edit action
                        },
                        style: ElevatedButton.styleFrom(primary: Color(0xFFD1BEB1),
                        ),
                        child: const Text('Edit', style: TextStyle(color: Color(0xFF776B6B),
                        ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Following, Ordrs, and Followers numbers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${profileInfo['following']}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Text(
                            'Following',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${profileInfo['ordrs']}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Text(
                            'Ordrs',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${profileInfo['followers']}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Text(
                            'Followers',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Keywords below in bold and different style
                  const Text(
                    'Configuration',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Personal Data\nPayments\nLog in and security\nAccessibility\nNotifications\nPrivacy\nHelp\nLegal\nLog Out'),
                  const SizedBox(height: 16.0),
                  // "Register your Oplace" button centered
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Logic for the register Oplace action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD1BEB1),
                      ),
                      child: const Text('Register your Oplace',
                      style: TextStyle(color: Color(0xFF776B6B)),),
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
