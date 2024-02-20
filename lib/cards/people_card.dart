import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String name;
  final String nameId;
  final String mainImageUrl;
  final String status;
  final List<Map<String, dynamic>> reviews;
  final String lastOrders;

  UserProfileCard({
    required this.name,
    required this.nameId,
    required this.mainImageUrl,
    required this.status,
    required this.reviews,
    required this.lastOrders,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main image and name
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(mainImageUrl),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                    Text(nameId, style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              ],
            ),
          ),
          // Status
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Status: $status'),
          ),
          // Divider line
          Divider(color: Colors.grey, height: 1.0, thickness: 1.0),
          // Last orders and comments
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Last Orders:', style: TextStyle(fontWeight: FontWeight.bold)),
                for (var review in reviews)
                  Text('${review['oplace']}: ${review['rating']} stars - ${review['comment']}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
