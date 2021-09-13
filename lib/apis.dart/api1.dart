import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> getComics() async {
  final url = Uri.parse('https://xkcd.com/2/info.0.json');

  http.Response response =
      await http.get(url, headers: {'Accept': 'application/json'});

  if (response.statusCode == 200) {
 
    return Album.fromJson(jsonDecode(response.body));
  } else {
    
    throw Exception('Failed to load album');
  }
}

class Album {
  String month;
  int num;
  String link;
  String year;
  String news;
  String safeTitle;
  String transcript;
  String alt;
  String img;
  String title;
  String day;
  Album({
    required this.month,
    required this.num,
    required this.link,
    required this.year,
    required this.news,
    required this.safeTitle,
    required this.transcript,
    required this.alt,
    required this.img,
    required this.title,
    required this.day,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        month: json["month"],
        num: json["num"],
        link: json["link"],
        year: json["year"],
        news: json["news"],
        safeTitle: json["safe_title"],
        transcript: json["transcript"],
        alt: json["alt"],
        img: json["img"],
        title: json["title"],
        day: json["day"],
      );
}

void main() => runApp(const Apid());

class Apid extends StatefulWidget {
  const Apid({Key? key}) : super(key: key);

  @override
  _ApidState createState() => _ApidState();
}

class _ApidState extends State<Apid> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getComics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
