import 'package:flutter/material.dart';

class ListTileShadow extends StatelessWidget {
  final Widget? leading;
  final String title;
  final int? count;
  final VoidCallback onTap;
  final Color? color;
  const ListTileShadow({
    super.key,
    this.leading,
    required this.title,
    this.count,
    required this.onTap,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: (leading != null) ? 6 : 0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        trailing: Text(
          '${count ?? ''}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
