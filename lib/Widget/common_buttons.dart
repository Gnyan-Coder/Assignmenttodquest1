import 'package:assgintodo/Widget/constant.dart';
import 'package:flutter/material.dart';


class CommonMaterialButton extends StatefulWidget {
  CommonMaterialButton({
    Key? key,
    required this.title,
    this.style,
    this.onPressed,
    required this.color,
    this.height,
    this.width,
    required this.horizontal,
    required this.vertical,
    required this.borderColor,
    required this.radius,
    this.isButtonDisable = false,
    this.isLoading = false,
  }) : super(key: key);

  String title;
  TextStyle? style;
  dynamic onPressed;
  Color color;
  double? width;
  double? height;
  Color borderColor;
  double horizontal;
  double vertical;
  BorderRadiusGeometry radius;
  bool isLoading;
  bool isButtonDisable;
  @override
  State<CommonMaterialButton> createState() => _CommonMaterialButtonState();
}

class _CommonMaterialButtonState extends State<CommonMaterialButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: !widget.isLoading
          ? widget.isButtonDisable
              ? widget.color.withOpacity(0.1)
              : widget.color
          : widget.color,
      // color: Colors.teal,
      minWidth: widget.width,
      elevation: 5.0,
      height: widget.height,

      shape: RoundedRectangleBorder(
          borderRadius: widget.radius,
          side: BorderSide(color: widget.borderColor, width: 1)),
      onPressed: widget.onPressed,

      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widget.horizontal,
              vertical: widget.isLoading ? 10 : widget.vertical),
          child: !widget.isLoading
              ? Text(
                  textAlign: TextAlign.center,
                  widget.title,
                  style: widget.style,
                )
              : Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(
                    color: Color(whiteColor),
                  ),
                )),
    );
  }
}