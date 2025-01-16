import 'package:flutter/material.dart';

import 'alert_cancel.dart';

class ListTileShadow extends StatelessWidget {
  final Widget? leading;
  final String title;
  final int? count;
  final Widget nextScreen;
  final Color? color;
  final bool? hasAlert;
  const ListTileShadow({
    super.key,
    this.leading,
    required this.title,
    this.count,
    required this.nextScreen,
    this.color,
    this.hasAlert,
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
        onTap: () => (hasAlert != null)
            ? AlertCancel(
                title: "Are you sure you want to log out?",
                textButton: "Log out",
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => nextScreen,
                  ),
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextScreen),
              ),
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
