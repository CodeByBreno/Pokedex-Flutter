import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/notifier.dart';

class PageCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<PageNotifier>(context);

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text("${pageNotifier.currentPage + 1}",),
    );
  }
}