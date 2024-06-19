import 'package:central_mobile/models/lecturer.dart';
import 'package:flutter/material.dart';

class LecturerLayout extends StatelessWidget {
  final Lecturer lecturer;

  const LecturerLayout({super.key, required this.lecturer});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          'https://via.placeholder.com/150',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(lecturer.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 1),
            Text(lecturer.nip,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                maxLines: 1),
          ]),
        )
      ],
    );
  }
}
