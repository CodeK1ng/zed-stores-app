import 'package:flutter/material.dart';
import 'package:zed_stores/pages/product_details_page.dart';
import 'package:zed_stores/pages/search_page.dart';
import 'package:zed_stores/pages/shopping_cart_page.dart';
import 'package:zed_stores/services/models/product.dart';
import 'package:zed_stores/services/models/supplier.dart';
import 'package:zed_stores/services/products.dart';
import 'package:zed_stores/widgets/product_widget.dart';
import 'package:zed_stores/widgets/seller_card.dart';
import 'package:zed_stores/widgets/tag_widget.dart';

class AppHomePage extends StatefulWidget {
  final String title;

  const AppHomePage({super.key, required this.title});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  List<ProductResponse> searchResults = [];
  List<SupplierResponse> suppliersResults = [];

  @override
  void initState() {
    super.initState();
    // Call the function to fetch products when the widget is initialized
    fetchAndSetProducts();
    fetchAndSetSuppliers();
  }

  Future<void> fetchAndSetProducts() async {
    // Assume you have a function named fetchProducts that returns a List<Product>
    List<ProductResponse> products = await fetchProducts();

    // Update the state with the fetched products
    setState(() {
      searchResults = products;
    });
  }

  Future<void> fetchAndSetSuppliers() async {
    // Assume you have a function named fetchSuppliers that returns a List<Supplier>
    List<SupplierResponse> suppliers = await fetchSuppliers();

    // Update the state with the fetched suppliers
    setState(() {
      suppliersResults = suppliers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ShoppingCartPage(),
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
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
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Horizontal scrolling tags
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TagWidget(
                        text: 'Saved',
                        icon: Icon(
                          Icons.favorite_outline,
                          size: 16,
                        )),
                    TagWidget(
                        text: 'Deals',
                        icon: Icon(
                          Icons.local_offer_outlined,
                          size: 16,
                        )),
                    TagWidget(
                        text: 'Headphones',
                        icon: Icon(
                          Icons.headset_outlined,
                          size: 16,
                        )),
                    TagWidget(
                        text: 'Computers',
                        icon: Icon(
                          Icons.computer_outlined,
                          size: 16,
                        )),
                    TagWidget(
                        text: 'Phones',
                        icon: Icon(
                          Icons.phone_android_outlined,
                          size: 16,
                        )),
                    // Add more tags as needed
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Banner
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Recommended products
              Text('Recently added items',
                  style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 16),
              // Product list horizontal scrolling
              SizedBox(
                height: 190, // Adjust the height of the horizontal list
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: searchResults
                      .map(
                        (result) => GestureDetector(
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
                          child: ProductWidget(
                            name: result.name!,
                            image: result.imageUrls!.length > 0
                                ? result.imageUrls![0]
                                : '',
                            price: double.parse(result.price!),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              // const SizedBox(height: 16),

              // Recommended products
              Text('Recommended for you',
                  style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 16),
              // Product list horizontal scrolling
              SizedBox(
                height: 190, // Adjust the height of the horizontal list
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [],
                ),
              ),

              const SizedBox(height: 16),

              // Recommended Sellers
              Text('Recommended Sellers',
                  style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 16),
              // Product list horizontal scrolling

              SizedBox(
                height: 200, // Adjust the height of the horizontal list
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: suppliersResults
                      .map(
                        (result) => GestureDetector(
                          onTap: () {
                            // Navigate to ProductDetailsPage with product ID
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ProductDetailsPage(
                            //       product: result,
                            //     ),
                            //   ),
                            // );
                            print(result.imageUrl);
                          },
                          child: SellerCard(
                            sellerName: result.name!,
                            sellerImage: result.imageUrl!,
                            sellerRating: '4.5',
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResult {
  final String name;
  final String image;
  final double price;

  SearchResult({
    required this.name,
    required this.image,
    required this.price,
  });
}

var searchResults = [
  SearchResult(
    name: 'Apple iPhone 14 Pro Max 256 GB',
    image: 'assets/images/product.jpeg',
    price: 100,
  ),
  SearchResult(
    name: 'Product 2',
    image: 'assets/images/product2.jpeg',
    price: 200,
  ),
  SearchResult(
    name: 'Product 3',
    image: 'assets/images/product1.jpeg',
    price: 300,
  ),
  SearchResult(
    name: 'Product 3',
    image: 'assets/images/product1.jpeg',
    price: 300,
  ),
  SearchResult(
    name: 'Product 3',
    image: 'assets/images/product1.jpeg',
    price: 300,
  ),
  SearchResult(
    name: 'Product 3',
    image: 'assets/images/product1.jpeg',
    price: 300,
  ),
  SearchResult(
    name: 'Product 3',
    image: 'assets/images/product1.jpeg',
    price: 300,
  ),
  SearchResult(
    name: 'Product 3',
    image: 'assets/images/product1.jpeg',
    price: 300,
  ),
  SearchResult(
    name: 'Product 3',
    image: 'assets/images/product1.jpeg',
    price: 300,
  ),
  SearchResult(
    name: 'Product 3',
    image: 'assets/images/product1.jpeg',
    price: 300,
  ),
  SearchResult(
    name: 'Product 3',
    image: 'assets/images/product1.jpeg',
    price: 300,
  ),
];
