import 'package:flutter/material.dart';

Widget CustomDrawer() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15,
      top: 15,
    ),
    child: Row(
      children: [
        Icon(
          Icons.dashboard,
          size: 18,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Icon(
          Icons.arrow_right,
          color: Colors.white,
          size: 25,
        )
      ],
    ),
  );
}

Widget customDrawer2() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15,
      top: 15,
    ),
    child: Row(
      children: [
        Icon(
          Icons.people,
          size: 18,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Customer",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Icon(
          Icons.arrow_right,
          color: Colors.white,
          size: 25,
        )
      ],
    ),
  );
}

Widget customDrawer3() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15,
      top: 15,
    ),
    child: Row(
      children: [
        Icon(
          Icons.article,
          size: 18,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Invoice",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Icon(
          Icons.arrow_right,
          color: Colors.white,
          size: 25,
        )
      ],
    ),
  );
}

Widget customDrawer4() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15,
      top: 15,
    ),
    child: Row(
      children: [
        Icon(
          Icons.payments,
          size: 18,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Payment",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Icon(
          Icons.arrow_right,
          color: Colors.white,
          size: 25,
        )
      ],
    ),
  );
}
