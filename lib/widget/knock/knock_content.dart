import 'package:figma/data/house_data.dart';
import 'package:figma/model/knock_model.dart';
import 'package:figma/widget/house/house_card.dart';
import 'package:figma/widget/text/link_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/knock_data.dart';
class KnockContent extends StatelessWidget {
  final KnockModel knockModel;
  const KnockContent({super.key, required this.knockModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (knockModel.status == KnockStatus.madeByMe) ...madeByMe,
        if (knockModel.status == KnockStatus.upcoming) ...upcoming,
        if (knockModel.status == KnockStatus.declined)
          ...getDeclinedContent(context: context, knockModel: knockModel),
        if (knockModel.status == KnockStatus.negotiation)
          ...getNegotiationContent(knockModel: knockModel),
        if (knockModel.status == KnockStatus.received ||
            knockModel.status == KnockStatus.exchanged)
          HouseCard(
            houseModel: houses[0],
            onTap: () {},
            inKnock: true,
          ),
      ],
    );
  }
}

final madeByMe = [
  Text(
    "You knocked sucessfully!",
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  SizedBox(height: 8),
  Text("Let’s wait for the other member to accept your request."),
];
final upcoming = [
  Text(
    "Exchange is confirmed!",
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  SizedBox(height: 8),
  Text("Enjoy your exchange! We will send a reminder 2 days before your trip!"),
];
List<Widget> getNegotiationContent({required KnockModel knockModel}) {
  return [
    Text(
      "Now you are able to chat with each other. Good luck with your potential exchange!",
    ),
    SizedBox(height: 8),
    Text(
      "Now you can contact ${knockModel.house.owner.name}!",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    LinkText(
      text: "Write Message",
      onTap: () {},
      isBold: true,
    ),
  ];
}

List<Widget> getDeclinedContent({
  required BuildContext context,
  required KnockModel knockModel,
}) {
  return [
    Text(
      "Unfortunately Knock is declined.",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 8),
    RichText(
      text: TextSpan(
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        children: [
          TextSpan(
            text: "Reason: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: mapCancelReason[knockModel.reason] ?? "",
          ),
        ],
      ),
    ),
    SizedBox(height: 8),
    RichText(
      text: TextSpan(
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        children: [
          TextSpan(
            text: "Additional: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: knockModel.additional ?? ""),
        ],
      ),
    ),
  ];
}
