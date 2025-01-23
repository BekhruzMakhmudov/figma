import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final Color color;
  final double size;
  final Widget title;
  final Widget? subtitle;
  final bool? isActive;
  final Widget? button;
  const ProfileCard({
    super.key,
    required this.color,
    required this.size,
    required this.title,
    this.subtitle,
    this.isActive,
    this.button,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: size,
              height: size,
              margin: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Rounded corners
                color: color,
              ),
            ),
            if (isActive != null)
              Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                    Icons.circle,
                    size: 15,
                    color: (isActive!) ? Colors.greenAccent : Colors.grey,
                  ),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title,
                  button?? Container(),
                ],
              ),
              subtitle ?? Container(),
            ],
          ),
        ),
      ],
    );
  }
}
