import 'calculator_brain.dart';
import 'input_page.dart';
import 'package:flutter/material.dart';
import 'result_page.dart';
import 'constants.dart';
import 'cardstyle.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttontitle});
  final void Function() onTap;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            buttontitle,
            style: resultdesign,
          ),
        ),
        width: double.infinity,
        color: klcolor,
        height: kbottomch,
      ),
    );
  }
}
