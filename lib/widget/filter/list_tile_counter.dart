import 'package:flutter/material.dart';

class ListTileCounter extends StatefulWidget {
  final String title;
  final String? subtitle;
  final int value;
  final Function(int) onChanged;
  const ListTileCounter({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  State<ListTileCounter> createState() => _RangeNumberState();
}

class _RangeNumberState extends State<ListTileCounter> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(widget.subtitle ?? ""),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (widget.value > 0) {
                  widget.onChanged(widget.value - 1);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.value}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed:() => widget.onChanged(widget.value + 1),
            ),
          ),
        ],
      ),
    );
  }
}
