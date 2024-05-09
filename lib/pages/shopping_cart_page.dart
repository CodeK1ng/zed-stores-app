import 'package:flutter/material.dart';
import 'package:zed_stores/pages/product_details_page.dart';
import 'package:zed_stores/services/models/product.dart';
import 'package:zed_stores/services/products.dart';
import 'package:zed_stores/widgets/cart_product_card.dart';
import 'package:zed_stores/widgets/search_result_product_card.dart';
import 'package:zed_stores/core/utils/reusables.dart';
import 'package:zed_stores/core/constants/constants.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final result = searchResults[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to ProductDetailsPage with product ID
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          product: result,
                        ),
                      ),
                    );
                  },
                  child: CartProductCard(
                    name: result.name!,
                    image: result.imageUrls!.first,
                    price: double.parse(result.price!),
                  ),
                );
              },
            ),
            // const SizedBox(height: 16),
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Items(3)',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '\ZMW600.00',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '\ZMW90.00',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '\ZMW690.00',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to CheckoutPage
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 45.0)),
                    ),
                    child: Text(
                      'Proceed to Checkout',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SearchResult {
//   final String name;
//   final String image;
//   final double price;

//   SearchResult({
//     required this.name,
//     required this.image,
//     required this.price,
//   });
// }

var searchResults = [
  ProductResponse(
    name: 'Apple iPhone 14 Pro Max 256 GB',
    imageUrls: [
      'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    price: "100",
    discount: 10,
    stock: 100,
    salePrice: "90",
    sale: true,
    description:
        'The Apple iPhone 14 Pro Max 256 GB is the latest and greatest iPhone yet. It has a 256 GB storage capacity and comes in a variety of colors.',
    supplier: Supplier(
      name: 'Apple',
      imageUrl:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      email: 'admin@mobilemonsters.com',
      phoneNumbers: ['+260 123 456 7890', '+260 123 456 7890'],
      address: 'Lusaka Zambia',
      city: 'Lusaka',
      province: 'Lusaka',
      country: 'Zambia',
      id: 1,
      createdAt: DateTime.parse('2024-02-22T20:43:41.003Z'),
      updatedAt: DateTime.parse('2024-02-22T20:43:41.003Z'),
    ),
  ),
];
