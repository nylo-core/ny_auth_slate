String stubButtons() => '''
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/bootstrap/helpers.dart';

class AccentButton extends StatelessWidget {
  const AccentButton({
    Key? key,
    required this.title,
    this.action,
  }) : super(key: key);

  final String title;
  final void Function()? action;

  @override
  Widget build(BuildContext context) => DefaultButton(
        key: key,
        title: title,
        action: action,
        textStyle: Theme.of(context).textTheme.bodyLarge,
        bgColor: ThemeColor.get(context).primaryAccent,
      );
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.title,
    this.action,
  }) : super(key: key);

  final String title;
  final void Function()? action;

  @override
  Widget build(BuildContext context) => DefaultButton(
        key: key,
        title: title,
        action: action,
        textStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.white),
        bgColor: ThemeColor.get(context).buttonBackground,
      );
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.title,
    this.action,
    this.textStyle,
    this.bgColor,
  }) : super(key: key);

  final String title;
  final void Function()? action;
  final TextStyle? textStyle;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: (screenWidth >= 385 ? 55 : 49),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.all(8),
            elevation: 0,
            backgroundColor: bgColor,
            shadowColor: Colors.transparent),
        child: Text(
          title,
          style: textStyle,
          maxLines: (screenWidth >= 385 ? 2 : 1),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        onPressed: action,
      ),
    );
  }
}

class PrimaryButtonWidget extends StatefulWidget {
  final Function() action;
  final String text;
  final bool isSelected;
  final bool? isLoading;
  final Color? color;

  PrimaryButtonWidget(
      {Key? key,
      required this.action,
      required this.text,
      this.isLoading,
      this.isSelected = false,
      this.color})
      : super(key: key);

  @override
  _PrimaryButtonWidgetState createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        padding: EdgeInsets.all(12),
        color: widget.color ?? ThemeColor.get(context).buttonBackground,
        disabledColor: Colors.grey,
        onPressed: (widget.isLoading ?? false) ? null : widget.action,
        elevation: 0,
        child: (widget.isLoading ?? false)
            ? CupertinoActivityIndicator()
            : Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .setColor(context, (color) => color.buttonPrimaryContent),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
''';
