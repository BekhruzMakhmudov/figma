import 'package:figma/data/house_data.dart';
import 'package:figma/model/knock_model.dart';
import 'package:flutter/material.dart';

enum KnockStatus {
  madeByMe,
  received,
  declined,
  negotiation,
  upcoming,
  exchanged,
}

final knockStatusTitle = {
  KnockStatus.madeByMe: "Knocks made by Me",
  KnockStatus.received: "Knocks received",
  KnockStatus.declined: "Declined",
  KnockStatus.negotiation: "Negotiation",
  KnockStatus.upcoming: "Upcoming Exchanges",
  KnockStatus.exchanged: "Exchanged",
};
final knockStatusSubtitle = {
  KnockStatus.madeByMe: 'You knocked',
  KnockStatus.received: 'Knocked',
  KnockStatus.declined: 'by',
  KnockStatus.negotiation: 'Accepted',
  KnockStatus.upcoming: 'Deal',
  KnockStatus.exchanged: 'Success',
};
final knockStatusConfirm = {
  KnockStatus.madeByMe: 'You knocked',
  KnockStatus.received: 'Accept',
  KnockStatus.negotiation: 'Deal',
  KnockStatus.exchanged: 'Rate House',
};
final knockStatusCancel = {
  KnockStatus.madeByMe: 'Cancel',
  KnockStatus.received: 'Decline',
  KnockStatus.negotiation: 'Decline',
  KnockStatus.upcoming: 'Cancel Deal',
};
final knockStatusUserButton = {
  KnockStatus.received: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
    ),
    child: Row(
      children: [
        Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        SizedBox(width: 4),
        Text("New")
      ],
    ),
  ),
  KnockStatus.negotiation: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue.withAlpha(70),
      foregroundColor: Colors.white,
    ),
    child: Text("Negotiation"),
  ),
  KnockStatus.exchanged: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
    ),
    child: Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.white,
        ),
        SizedBox(width: 4),
        Text("Rate")
      ],
    ),
  ),
  KnockStatus.upcoming: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue.withAlpha(70),
      foregroundColor: Colors.white,
    ),
    child: Text("Deal"),
  ),
};

List<KnockModel> knocks = [
  KnockModel(
    date: "19.09.21, 10:30",
    period: "27 May - 6 June",
    house: houses[0],
    status: KnockStatus.madeByMe,
  ),
  KnockModel(
    date: "19.09.21, 10:30",
    period: "27 May - 6 June",
    house: houses[0],
    status: KnockStatus.received,
  ),
  KnockModel(
    date: "19.09.21, 10:30",
    period: "27 May - 6 June",
    house: houses[0],
    status: KnockStatus.negotiation,
  ),
  KnockModel(
    date: "19.09.21, 10:30",
    period: "27 May - 6 June",
    house: houses[0],
    status: KnockStatus.upcoming,
  ),
  KnockModel(
    date: "19.09.21, 10:30",
    period: "27 May - 6 June",
    house: houses[0],
    status: KnockStatus.exchanged,
  ),
  KnockModel(
    date: "19.09.21, 10:30",
    period: "27 May - 6 June",
    house: houses[0],
    status: KnockStatus.declined,
  ),
];

Map<KnockStatus, int> getknockCount() {
  Map<KnockStatus, int> result = {};
  for (final i in knocks) {
    result[i.status] = (result[i.status] ?? 0) + 1;
  }
  return result;
}
