import 'package:figma/data/filter_data.dart';
import 'package:flutter/material.dart';

class ChipStatus extends StatelessWidget {
  final StatusFilters status;
  final bool? selected;
  final ValueChanged<bool>? onSelected;
  const ChipStatus({
    super.key,
    required this.status,
    this.selected = true,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return (onSelected == null)
        ? Chip(
            padding: EdgeInsets.zero,
            side: BorderSide.none,
            backgroundColor: Colors.blue,
            label: Text(
              status.text,
              style: TextStyle(color: Colors.white),
            ),
          )
        : FilterChip(
            padding: EdgeInsets.zero,
            side: BorderSide.none,
            showCheckmark: false,
            selectedColor: Colors.blue,
            backgroundColor: Colors.blue.withAlpha(70),
            label: Text(
              status.text,
              style: TextStyle(color: Colors.white),
            ),
            selected: selected!,
            onSelected: onSelected,
          );
  }
}
