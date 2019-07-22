import 'package:flutter/material.dart';
import 'package:imc_improved/utils/utils.dart';

class IconCardWithTap extends StatefulWidget {
  final Function onTapFunction;
  final String title;
  final IconData icon;
  final bool status;
  IconCardWithTap({this.onTapFunction, this.title, this.status, this.icon});

  _IconCardWithTapState createState() => _IconCardWithTapState();
}

class _IconCardWithTapState extends State<IconCardWithTap> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapFunction,
      child: Card(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 11, 30, 11),
                child: Icon(widget.icon,
                    size: 90,
                    color: widget.status == true
                        ? Colors.white
                        : DefaultColors.disabled),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 11, 30, 11),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: widget.status == true
                          ? Colors.white
                          : DefaultColors.disabled),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
