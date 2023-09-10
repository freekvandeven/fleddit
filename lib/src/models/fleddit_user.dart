import 'package:flutter/material.dart';

@immutable
class FledditUser {
  const FledditUser({
    required this.username,
    required this.karma,
    required this.cakeDay,
    required this.deleted,
    required this.posts,
    required this.comments,
    required this.moderatedSubreddits,
  });

  factory FledditUser.fromJson(Map<String, dynamic> json, String username) =>
      FledditUser(
        username: username,
        karma: json['karma'],
        cakeDay: DateTime.parse(json['cake_day']),
        deleted: json['deleted'] ?? false,
        posts: json['posts'] != null ? List<String>.from(json['posts']) : [],
        comments:
            json['comments'] != null ? List<String>.from(json['comments']) : [],
        moderatedSubreddits: json['moderated_subreddits'] != null
            ? List<String>.from(json['moderated_subreddits'])
            : [],
      );

  final String username;
  final int karma;

  /// The day the user created the account
  final DateTime cakeDay;

  /// A user can be banned from reddit
  final bool deleted;

  /// The string contains the subreddit in the first part and the post id after
  final List<String> posts;

  /// The string contains the subreddit in the first part and the post id after
  /// and the comment id after
  final List<String> comments;

  /// The list of subreddits that the user is a moderator of
  final List<String> moderatedSubreddits;
}
