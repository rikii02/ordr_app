import 'package:flutter/material.dart';

class LastOrdrsCard extends StatelessWidget {
  final String placeName;
  final int rating;
  final String comment;

  LastOrdrsCard({
    required this.placeName,
    required this.rating,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Place: $placeName',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Rating: $rating',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Comment: $comment',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
