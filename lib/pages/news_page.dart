import 'package:flutter/material.dart';
import 'package:newsapp/models/student.dart';

final students = [
  Student(
      name: "Mary",
      image:
          'https://media.istockphoto.com/id/536810069/photo/the-heart-of-virgin-mary-typical-catholic-image.jpg?s=612x612&w=0&k=20&c=JdBkCPsdSCTEeWPgXLYGt4h75tk34uwQyPpOu50NfJ8='),
  Student(
      name: "John",
      image:
          'https://media.istockphoto.com/id/536810069/photo/the-heart-of-virgin-mary-typical-catholic-image.jpg?s=612x612&w=0&k=20&c=JdBkCPsdSCTEeWPgXLYGt4h75tk34uwQyPpOu50NfJ8='),
  Student(
      name: "Joy",
      image:
          'https://media.istockphoto.com/id/536810069/photo/the-heart-of-virgin-mary-typical-catholic-image.jpg?s=612x612&w=0&k=20&c=JdBkCPsdSCTEeWPgXLYGt4h75tk34uwQyPpOu50NfJ8='),
  Student(
      name: "Brian",
      image:
          'https://media.istockphoto.com/id/536810069/photo/the-heart-of-virgin-mary-typical-catholic-image.jpg?s=612x612&w=0&k=20&c=JdBkCPsdSCTEeWPgXLYGt4h75tk34uwQyPpOu50NfJ8='),
  Student(
      name: "Maggy",
      image:
          'https://media.istockphoto.com/id/536810069/photo/the-heart-of-virgin-mary-typical-catholic-image.jpg?s=612x612&w=0&k=20&c=JdBkCPsdSCTEeWPgXLYGt4h75tk34uwQyPpOu50NfJ8='),
  Student(
      name: "Tom",
      image:
          'https://media.istockphoto.com/id/536810069/photo/the-heart-of-virgin-mary-typical-catholic-image.jpg?s=612x612&w=0&k=20&c=JdBkCPsdSCTEeWPgXLYGt4h75tk34uwQyPpOu50NfJ8=')
];

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          title: const Text('News App'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) =>
              //  Row(
              //   children: [
              //     Image.network(
              //       students[index].image,
              //       height: 200,
              //       width: 200,
              //       fit: BoxFit.cover,
              //     ),
              //     Text(
              //       students[index].name,
              //       style: const TextStyle(fontSize: 23, color: Colors.amber),
              //     ),
              //   ],
              // ),

              Column(
            children: [
              Image.network(
                students[index].image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(
                students[index].name,
                style: const TextStyle(fontSize: 23, color: Colors.amber),
              ),
            ],
          ),
          itemCount: students.length,
        ));
  }
}
