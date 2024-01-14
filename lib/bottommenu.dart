import 'package:flutter/material.dart';


class BotttomMenu extends StatelessWidget {
  const BotttomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Icon(
              Icons.multitrack_audio_sharp,
              size: 24,
            ),
            Text(
              "Thi Truong",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.multitrack_audio_sharp,
              size: 24,
            ),
            Text(
              "Thi Truong",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.multitrack_audio_sharp,
              size: 24,
            ),
            Text(
              "Thi Truong",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.multitrack_audio_sharp,
              size: 24,
            ),
            Text(
              "Thi Truong",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.multitrack_audio_sharp,
              size: 24,
            ),
            Text(
              "Thi Truong",
              style: TextStyle(fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}
