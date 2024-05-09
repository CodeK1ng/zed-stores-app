import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:zed_stores/services/models/product.dart';
import 'package:zed_stores/services/products.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductResponse product; // Add this field to store the product

  const ProductDetailsPage({super.key, required this.product});
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300, // Adjust the height as needed
              child: PhotoViewGallery.builder(
                itemCount: widget.product.imageUrls!.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider:
                        NetworkImage(widget.product.imageUrls![index]),
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    heroAttributes: PhotoViewHeroAttributes(tag: index),
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.black,
                ),
                pageController: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              height: 100, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.imageUrls!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        width: 80, // Adjust the width as needed
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: index == currentIndex
                                ? Colors
                                    .blue // Highlight the selected thumbnail
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                          widget.product.imageUrls![index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Condition:',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Good Second Hand',
                      ),
                    ],
                  ),
                  // Text(
                  //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                  //     style: Theme.of(context).textTheme.bodySmall!),
                  const SizedBox(height: 8),
                  Text(
                    'ZMW ${widget.product.price}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  // Discount
                  Row(
                    children: [
                      Text(
                        'ZMW 15,000.00',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '20% off',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.green,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Delivery details
                  Row(
                    children: [
                      const Icon(Icons.local_shipping, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'Delivered in 1-2 hours via Yango Delivery within Lusaka',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/seller1.jpeg'),
                    ),
                    title: Text(widget.product.supplier!.name!,
                        style: Theme.of(context).textTheme.titleMedium),
                    subtitle: const Row(
                      children: [
                        Text(
                          'Phones and Laptops',
                        ),
                      ],
                    ),
                  ),
                  Text(widget.product.supplier!.address!,
                      style: Theme.of(context).textTheme.bodySmall!),

                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
