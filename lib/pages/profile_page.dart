import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'user_avatar.jpg'), // Replace with your user's avatar
            ),
            const SizedBox(height: 16),
            Text(
              'John Doe', // Replace with your user's name
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8),
            Text(
              'john.doe@example.com', // Replace with your user's email
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 16),
            _buildRatingSection(),
            const SizedBox(height: 16),
            _buildDetailsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.yellow),
        const SizedBox(width: 4),
        Text(
          '4.5', // Replace with your user's rating
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        Text(
          '(123 Ratings)', // Replace with your user's total ratings
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
            'Location', 'New York, USA'), // Replace with your user's location
        _buildDetailRow('Member Since',
            'January 2020'), // Replace with your user's registration date
        _buildDetailRow(
            'Items Sold', '200+'), // Replace with your user's total items sold
      ],
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
