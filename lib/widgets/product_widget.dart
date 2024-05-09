import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const ProductWidget(
      {Key? key, required this.name, required this.image, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), // Circular border
            ),
            clipBehavior: Clip.antiAlias, // Clip content to the rounded shape
            child: Image.network(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _truncateProductName(name),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2, // Limit to 2 lines
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '\ZMW$price',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.green),
          ),
        ],
      ),
    );
  }
}

String _truncateProductName(String productName) {
  const int maxLength = 20; // You can adjust this value based on your design
  return (productName.length > maxLength)
      ? '${productName.substring(0, maxLength)}...'
      : productName;
}
