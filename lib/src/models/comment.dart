import 'package:flutter/material.dart';

@immutable
class Comment {
  const Comment({
    required this.id,
    required this.text,
    required this.author,
    required this.referenceComment,
    required this.deleted,
    required this.created,
    required this.upvotes,
    required this.downvotes,
    required this.awards,
  });

  factory Comment.fromJson(Map<String, dynamic> json, String id) => Comment(
        id: id,
        text: json['text'],
        author: json['author'],
        referenceComment: json['reference_comment'],
        deleted: json['deleted'] ?? false,
        created: DateTime.parse(json['created']),
        upvotes: json['upvotes'],
        downvotes: json['downvotes'],
        awards: json['awards'],
      );

  /// Unique identifier of the comment
  final String id;
  final String text;
  final String author;

  /// the id of the comment that this comment is replying to (if any)
  final String? referenceComment;

  /// if the comment is deleted by moderators or the author
  final bool deleted;
  final DateTime created;
  final int upvotes;
  final int downvotes;
  final int awards;
}
