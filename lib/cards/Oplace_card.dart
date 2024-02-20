import 'package:flutter/material.dart';

class OPlaceCard extends StatelessWidget {
  final String name;
  final String nameId;
  final String status;
  final List<String> otags;
  final String mainImageUrl;
  final List<String> otherImages;
  final List<Map<String, dynamic>> reviews;
  final List<Map<String, dynamic>> users;

  OPlaceCard({
    required this.name,
    required this.nameId,
    required this.status,
    required this.otags,
    required this.mainImageUrl,
    required this.otherImages,
    required this.reviews,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(16.0),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        shrinkWrap: true,
        children: [
          // Separation between the main image and the borders
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(mainImageUrl),
                    ),
                  ),
                ),
                // Name and Name_ID
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(nameId,
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          // OtTags below the name and image
          Padding(
            padding: const EdgeInsets.only(left: 24.0, bottom: 16.0),
            child: Wrap(
              spacing: 8.0,
              children: otags.map((otag) {
                return Chip(
                    label: Text(otag),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: const Color(0xFFD1BEB1),
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.transparent)));
              }).toList(),
            ),
          ),
          // Larger gallery images without title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display gallery images
                // You can use a ListView.builder or any other approach based on your needs
                Wrap(
                  spacing: 8.0,
                  children: otherImages.map((imageUrl) {
                    return Image.asset(imageUrl,
                        height: 120.0, width: 120.0, fit: BoxFit.cover);
                  }).toList(),
                ),
              ],
            ),
          ),
          // Divider line after Gallery
          const Divider(
              color:  Color(0xFFD1BEB1),
              height: 1.0,
              thickness: 1.0,
              indent: 24.0,
              endIndent: 24.0),
          // Rating with stars
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFD1BEB1)),
                // Display stars based on the rating
                Row(
                  children: List.generate(
                    calculateAverageRating(reviews).floor(),
                    (index) => const Icon(Icons.star, color: Color(0xFFD1BEB1)),
                  ),
                ),
                // Display half star if necessary
                if (calculateAverageRating(reviews) % 1 != 0)
                  const Icon(Icons.star_half, color: Color(0xFFD1BEB1)),
              ],
            ),
          ),
          // Display only user names
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: users.map((user) {
                return Text('${user['name']} (${user['id']})');
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  double calculateAverageRating(List<Map<String, dynamic>> reviews) {
    if (reviews.isEmpty) return 0.0;

    double totalRating = 0.0;

    for (var review in reviews) {
      // Adjust each individual rating to the range of 0 to 5
      double individualRating =
          (review['puntuation'] ?? 0).toDouble().clamp(0.0, 5.0);

      // Add the individual rating to the total
      totalRating += individualRating;
    }

    // Calculate the average and ensure it is in the range of 0 to 5
    double averageRating = (totalRating / reviews.length).clamp(0.0, 5.0);

    return averageRating;
  }
}
