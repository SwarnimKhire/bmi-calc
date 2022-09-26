import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_c.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calculator_brain.dart';
import 'bottombutton.dart';

enum GenderType {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedgender;
  int height = 180;
  int weight = 72;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  onpressed: () {
                    setState(() {
                      selectedgender = GenderType.male;
                    });
                  },
                  colour: selectedgender == GenderType.male
                      ? kactivecolor
                      : kinactivecolor,
                  cardchild: customcard(
                    cicon: FontAwesomeIcons.mars,
                    ctext: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onpressed: () {
                    setState(() {
                      selectedgender = GenderType.female;
                    });
                  },
                  colour: selectedgender == GenderType.female
                      ? kactivecolor
                      : kinactivecolor,
                  cardchild: customcard(
                    cicon: FontAwesomeIcons.venus,
                    ctext: 'FEMALE',
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
              child: ReusableCard(
            colour: kactivecolor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: labeltextstyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: cardtext,
                    ),
                    Text(
                      'cm',
                      style: labeltextstyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8E8D98),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: Color(0x29EB1555),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 420.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labeltextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: cardtext,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labeltextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: cardtext,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                  print(weight);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              buttontitle: 'CALCULATE',
              onTap: () {
                calculatorbrain calc =
                    calculatorbrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultspage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getrsult(),
                      Interpretation: calc.advice(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, this.onpressed});
  final IconData icon;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
