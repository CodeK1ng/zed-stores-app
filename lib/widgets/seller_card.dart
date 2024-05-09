import 'package:flutter/material.dart';
import 'package:zed_stores/core/utils/common.dart';

class SellerCard extends StatelessWidget {
  final String sellerName;
  final String sellerImage;
  final String sellerRating;

  const SellerCard({
    Key? key,
    required this.sellerName,
    required this.sellerImage,
    required this.sellerRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(8),
      // padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            // color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CircleAvatar(
          //   radius: 30,
          //   backgroundImage: AssetImage(sellerImage),
          // ),
          Container(
            height: 90,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: sellerImage == null
                    ? const AssetImage('assets/images/seller.jpeg')
                    : NetworkImage(sellerImage) as ImageProvider<Object>,
                // image: AssetImage(sellerImage),
                // image: NetworkImage(sellerImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  truncateName(sellerName),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text('Save', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15,
              ),
              const SizedBox(width: 4),
              Text(
                sellerRating,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
