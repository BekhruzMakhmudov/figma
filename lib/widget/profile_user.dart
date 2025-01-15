import 'package:figma/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/user_data.dart';

class ProfileUser extends StatelessWidget {
  final UserModel userModel;
  const ProfileUser({
    super.key,
    required this.userModel,
  });
  @override
  Widget build(BuildContext context) {
    bool isMyProfile = userModel == users[0];
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            color: userModel.avatar,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (!isMyProfile) Text('Houses: ${userModel.housesList.length}'),
              if (!isMyProfile) Divider(),
              if (!isMyProfile)
                Row(
                  children: [
                    Text('Activity: '),
                    Text(
                      userModel.isActive ? 'Online' : 'Offline',
                      style: TextStyle(
                          color:
                              userModel.isActive ? Colors.green : Colors.grey),
                    ),
                  ],
                ),
              Text(
                "Joined: Oct 2020",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              if (isMyProfile) Text(userModel.email),
              if (isMyProfile) Text(userModel.phone),
            ],
          ),
        ),
      ],
    );
  }
}
