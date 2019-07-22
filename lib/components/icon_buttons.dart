import 'package:flutter/material.dart';
import 'package:imc_improved/utils/utils.dart';

class CardWithButtons extends StatefulWidget {
  final String title;
  final dynamic data;
  final Function decreaseFunction;
  final Function increaseFunction;

  CardWithButtons(
      {Key key,
      this.title,
      this.data,
      this.decreaseFunction,
      this.increaseFunction})
      : super(key: key);

  _CardWithButtonsState createState() => _CardWithButtonsState();
}

class _CardWithButtonsState extends State<CardWithButtons> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // height: 16.50,
        // width: 16.50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16.5, 9, 16.5, 5),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: DefaultColors.disabled,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.5, 5, 16.5, 5),
              child: Text(
                "${widget.data}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.5, 11, 16.5, 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  PlusMinusButton(widget.decreaseFunction, Icons.remove),
                  SizedBox(
                    width: 16.5,
                  ),
                  PlusMinusButton(widget.increaseFunction, Icons.add),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlusMinusButton extends StatelessWidget {
  final Function function;
  final IconData icon;
  PlusMinusButton(this.function, this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
            color: hexToColor("#1c1f32"),
            borderRadius: BorderRadius.circular(50)),
        child: Icon(
          icon,
          size: 50,
        ),
      ),
    );
  }
}
