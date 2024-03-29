import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/text_styels.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Rifky',
        style: getBodyStyle(),
      ),
    );
  }
}
