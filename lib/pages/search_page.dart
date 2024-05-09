import 'package:flutter/material.dart';
import 'package:zed_stores/pages/product_details_page.dart';
import 'package:zed_stores/services/models/product.dart';
import 'package:zed_stores/services/products.dart';
import 'package:zed_stores/widgets/search_result_product_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    // Request focus after a short delay to ensure that the screen is fully built.
    Future.delayed(const Duration(milliseconds: 1), () {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                focusNode: _searchFocusNode,
                decoration: InputDecoration(
                  hintText: 'Search for anything',
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      // color: Theme.of(context).colorScheme.primary,
                      ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 15,
                  ),
                  prefixStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Save search
                  Row(
                    children: [
                      const Icon(Icons.favorite_outline,
                          color: Colors.red, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'Save Search',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Sort
                      Row(
                        children: [
                          const Icon(Icons.sort, color: Colors.red, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'Sort',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          const Icon(Icons.filter_alt_outlined,
                              color: Colors.red, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'Filter',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
                    child: SearchResultProductCard(
                      name: result.name!,
                      image: result.imageUrls!.first,
                      price: double.parse(result.price!),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// class Product {
//  final String name;
//   final String? description;
//   final String price;
//   final List<String> imageUrls;

//   Product({
//     required this.name,
//      this.description,
//     required this.price,
//     required this.imageUrls,
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
