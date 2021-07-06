part of 'widgets.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback? _onPressed;
  final String _text;
  final Color? _color;
  final Color? _fontColor;
  final EdgeInsetsGeometry? _margin;

  const BaseButton({
    Key? key,
    VoidCallback? onPressed,
    required String text,
    Color? color,
    Color? fontColor,
    EdgeInsetsGeometry? margin,
  })  : _onPressed = onPressed,
        _text = text,
        _color = color,
        _margin = margin,
        _fontColor = fontColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          _margin ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          primary: _color ?? yellowButtonColor,
          shadowColor: Colors.black,
          minimumSize: const Size(120, 30),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(defaultBorderRadius),
            ),
          ),
        ),
        onPressed: _onPressed,
        child: Text(
          _text,
          style: buttonLabelStyle1.copyWith(color: _fontColor ?? Colors.black),
        ),
      ),
    );
  }
}
