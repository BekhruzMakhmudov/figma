import 'package:flutter/material.dart';

class RangeNumber extends StatefulWidget {
  const RangeNumber({super.key});

  @override
  State<RangeNumber> createState() => _RangeNumberState();
}

class _RangeNumberState extends State<RangeNumber> {
  int value=2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (value > 1) {
                setState(() => value--);
              }
            },
          ),
        ),
        Text(
          '$value',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() => value++);
            },
          ),
        ),
      ],
    );
  }
}
