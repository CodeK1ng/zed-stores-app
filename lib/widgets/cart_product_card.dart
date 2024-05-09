import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const CartProductCard({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customize the appearance of your product card
      elevation: 1,
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            Container(
              width: 150,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    // Rating
                    // Row(
                    //   children: [
                    //     const Icon(Icons.star, color: Colors.yellow, size: 16),
                    //     const SizedBox(width: 4),
                    //     Text(
                    //       '4.5',
                    //       style: Theme.of(context).textTheme.bodySmall,
                    //     ),
                    //     const SizedBox(width: 4),
                    //     const Text(
                    //       '(123 Ratings)',
                    //       style: TextStyle(fontSize: 14, color: Colors.grey),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 4),
                    // Seller
                    Row(
                      children: [
                        const Icon(Icons.person_outline, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Mobile Monsters',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text('New', style: TextStyle(color: Colors.green)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('ZMW',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.green,
                                    )),
                            Text(
                              '$price',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Icon(Icons.remove_circle_outline, size: 20),
                        SizedBox(width: 6),
                        Text('1',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(width: 6),
                        Icon(Icons.add_circle_outline, size: 20),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Remove',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
