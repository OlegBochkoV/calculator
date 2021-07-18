import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonClass extends StatelessWidget {
  String button_label = '';
  int button_color = 0;
  int button_text_color = 0;
  Function callback;

  ButtonClass(
      {Key? key,
      required this.button_label,
      required this.button_color,
      required this.button_text_color,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        height: 75,
        width: 75,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            callback(button_label);
          },
          child: Text(
            button_label,
            style: TextStyle(color: Color(button_text_color), fontSize: 26),
          ),
          color: Color(button_color),
          splashColor: Colors.red,
        ),
      ),
    );
  }
}
