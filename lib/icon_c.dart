import 'package:flutter/material.dart';

import 'constants.dart';

class customcard extends StatelessWidget {
  customcard({this.cicon, this.ctext});

  final IconData? cicon;
  final String? ctext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cicon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          ctext!,
          style: labeltextstyle,
        )
      ],
    );
  }
}
