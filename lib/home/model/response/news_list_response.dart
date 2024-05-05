// To parse this JSON data, do
//
//     final newsListResponse = newsListResponseFromJson(jsonString);

import 'dart:convert';

NewsListResponse newsListResponseFromJson(String str) =>
    NewsListResponse.fromJson(json.decode(str));

String newsListResponseToJson(NewsListResponse data) =>
    json.encode(data.toJson());

class NewsListResponse {
  String category;
  List<Datum> data;
  bool success;

  NewsListResponse({
    required this.category,
    required this.data,
    required this.success,
  });

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      NewsListResponse(
        category: json["category"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
      };
}

class Datum {
  String author;
  String content;
  String date;
  String id;
  String imageUrl;
  String readMoreUrl;
  String time;
  String title;
  String url;

  Datum({
    required this.author,
    required this.content,
    required this.date,
    required this.id,
    required this.imageUrl,
    required this.readMoreUrl,
    required this.time,
    required this.title,
    required this.url,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        author: json["author"],
        content: json["content"],
        date: json["date"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        readMoreUrl: json["readMoreUrl"],
        time: json["time"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
        "date": date,
        "id": id,
        "imageUrl": imageUrl,
        "readMoreUrl": readMoreUrl,
        "time": time,
        "title": title,
        "url": url,
      };
  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'content': content,
      'date': date,
      'id': id,
      'imageUrl': imageUrl,
      'readMoreUrl': readMoreUrl,
      'time': time,
      'title': title,
      'url': url,
    };
  }
}
