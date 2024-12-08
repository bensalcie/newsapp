import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/news_response.dart';
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

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Articles>? newsList = [];
  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          title: const Text('News App'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Column(
            children: [
              Image.network(
                newsList?[index].urlToImage ?? '',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => SizedBox.shrink(),
              ),
              Text(
                newsList?[index].title ?? '',
                style: const TextStyle(fontSize: 23, color: Colors.amber),
              ),
            ],
          ),
          itemCount: newsList?.length,
        ));
  }

  void _fetchNews() async {
    final dio = Dio();
    final response = await dio.get(
        'https://newsapi.org/v2/everything?q=tesla&from=2024-11-08&sortBy=publishedAt&apiKey=8032b416514643b9a80f4779961cdc71');

    final newsResponse = NewsResponse.fromJson(response.data);

    setState(() {
      newsList = newsResponse.articles;
    });
  }
}
