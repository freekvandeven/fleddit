import 'package:flutter/material.dart';

@immutable
class Post {
  const Post({
    required this.title,
    required this.subreddit,
    required this.author,
    required this.labels,
    required this.images,
    required this.link,
    required this.video,
    required this.text,
    required this.hideContent,
    required this.id,
    required this.upvotes,
    required this.downvotes,
    required this.comments,
    required this.awards,
    required this.shares,
    required this.created,
  });

  factory Post.fromJson(
    Map<String, dynamic> json,
    String subreddit,
    String id,
  ) =>
      Post(
        title: json['title'],
        subreddit: subreddit,
        author: json['author'],
        labels: json['labels'] != null ? List<String>.from(json['labels']) : [],
        images: json['images'] != null ? List<String>.from(json['images']) : [],
        link: json['link'],
        video: json['video'],
        text: json['text'],
        hideContent: json['hideContent'],
        id: id,
        upvotes: json['upvotes'],
        downvotes: json['downvotes'],
        comments: json['comments'],
        awards: json['awards'],
        shares: json['shares'],
        created: DateTime.parse(json['created']),
      );

  final String title;
  final String subreddit;
  final String author;
  final List<String> labels;
  final List<String> images;
  final String? link;
  final String? video;
  final String? text;
  final bool hideContent;

  final String? id;
  final int upvotes;
  final int downvotes;
  final int comments;
  final int awards;
  final int shares;

  final DateTime created;
}
