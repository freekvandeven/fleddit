import 'package:flutter/material.dart';

@immutable
class Subreddit {
  const Subreddit({
    required this.name,
    required this.memberNickname,
    required this.description,
    required this.created,
    required this.members,
    required this.online,
    required this.moderators,
    required this.rules,
  });

  factory Subreddit.fromJson(Map<String, dynamic> json, String name) =>
      Subreddit(
        name: name,
        memberNickname: json['member_nickname'],
        description: json['description'],
        created: DateTime.parse(json['created']),
        members: json['members'],
        online: json['online'],
        moderators: json['moderators'] != null
            ? List<String>.from(json['moderators'])
            : [],
        rules: json['rules'] != null ? List<String>.from(json['rules']) : [],
      );

  final String name;
  final String memberNickname;
  final String description;
  final DateTime created;
  final int members;
  final int online;
  final List<String> moderators;
  final List<String> rules;
}
