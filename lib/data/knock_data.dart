import 'package:figma/data/house_data.dart';
import 'package:figma/model/knock_model.dart';
import 'package:flutter/material.dart';

enum KnockStatus {
  madeByMe(
    title: "Knocks made by Me",
    subtitle: "You knocked",
    confirm: "You knocked",
    cancel: "Cancel",
  ),
  received(
    title: "Knocks received",
    subtitle: "Knocked",
    confirm: "Accept",
    cancel: "Decline",
  ),
  declined(
    title: "Declined",
    subtitle: "by",
    confirm: "",
    cancel: "",
  ),
  negotiation(
    title: "Negotiation",
    subtitle: "Accepted",
    confirm: "Deal",
    cancel: "Decline",
  ),
  upcoming(
    title: "Upcoming Exchanges",
    subtitle: "Deal",
    confirm: "",
    cancel: "Cancel Deal",
  ),
  exchanged(
    title: "Exchanged",
    subtitle: "Success",
    confirm: "Rate House",
    cancel: "",
  );

  const KnockStatus({
    required this.title,
    required this.subtitle,
    required this.confirm,
    required this.cancel,
  });
  final String title;
  final String subtitle;
  final String confirm;
  final String cancel;
}

enum CancelReason {
  planChanged("My plans have changed"),
  foundBetter("I have found better place"),
  waitedLong("I waited too long for a respond"),
  unreliable("I found that member unreliable"),
  other("Other");

  const CancelReason(this.text);
  final String text;
}

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
    reason: CancelReason.unreliable,
    additional: 'It was really complicate to speak with that person',
  ),
];

Map<KnockStatus, List<KnockModel>> getMapKnock() {
  Map<KnockStatus, List<KnockModel>> result = {
    KnockStatus.madeByMe: [],
    KnockStatus.received: [],
    KnockStatus.declined: [],
    KnockStatus.negotiation: [],
    KnockStatus.upcoming: [],
    KnockStatus.exchanged: [],
  };
  for (var knock in knocks) {
    result[knock.status]!.add(knock);
  }
  return result;
}
