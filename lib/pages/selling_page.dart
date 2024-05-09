import 'package:flutter/material.dart';

class SellingPage extends StatefulWidget {
  const SellingPage({super.key});

  @override
  State<SellingPage> createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selling',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Coming Soon!'),
      ),
    );
  }
}
