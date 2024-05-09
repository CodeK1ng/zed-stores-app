import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String text;
  final Icon icon;

  const TagWidget({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 4),
              Text(
                text,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    // color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ),
        onTap: () {
          // Navigator.pushNamed(context, '/settings');
        },
      ),
    );
  }
}
