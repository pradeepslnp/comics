// To parse this JSON data, do
//
//     final comicModel = comicModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ComicModel comicModelFromJson(String str) =>
    ComicModel.fromJson(json.decode(str));

String comicModelToJson(ComicModel data) => json.encode(data.toJson());

class ComicModel {
  ComicModel({
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

  factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
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

  Map<String, dynamic> toJson() => {
        "month": month,
        "num": num,
        "link": link,
        "year": year,
        "news": news,
        "safe_title": safeTitle,
        "transcript": transcript,
        "alt": alt,
        "img": img,
        "title": title,
        "day": day,
      };
}
