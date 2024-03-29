import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/text_styels.dart';

class SourceView extends StatelessWidget {
  const SourceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Rifky SourceView',
        style: getBodyStyle(),
      ),
    );
  }
}
