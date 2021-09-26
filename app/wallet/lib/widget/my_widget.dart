import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/util/color_util.dart';

class MyWidget {
  static AppBar myAppBar(
    title, {
    bool centerTitle = true, //标题是否居中
    double elevation = 1, //appbar阴影底部阴影，将appBar设置为透明时需要设置为0
    Color appBarColor = Colors.white, //AppBar颜色
    Color titleColor = Colors.black, //字体和返回按钮颜色
    Brightness brightness = Brightness.light, //状态栏颜色 默认为深色（黑色），dark为白色
    List<Widget> actions,
    PreferredSizeWidget bottom,
    bool hasBackButton = true,
  }) {
    return AppBar(
      centerTitle: centerTitle,
      brightness: brightness,
      elevation: elevation,
      leading: hasBackButton ? BackButton(color: titleColor) : null,
      backgroundColor: appBarColor,
      actions: actions,
      bottom: bottom,
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
    );
  }

  static Widget myButton(
    String text, {
    double width,
    double height,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    VoidCallback onPressed,
    double fontSize,
    FontWeight fontWeight,
    Color backgroundColor,
    Color primary,
    Color textColor,
    AlignmentGeometry alignment,
  }) {
    print(width);
    return Container(
      width: width ?? double.infinity,
      height: height ?? 40,
      margin: margin,
      padding: padding,
      alignment: alignment,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: textColor,
          ),
          backgroundColor: backgroundColor ?? ColorUtil.setColor('#5A5B5F'),
          primary: primary ?? ColorUtil.setColor('#FAD7B3'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }

  //输入框TextField
  static Widget textFormField({
    TextEditingController controller,
    String hintText,
    Widget prefixIcon,
    Widget suffixIcon,
    bool obscureText = false,
    int maxLength,
    TextInputType keyboardType,
    EdgeInsetsGeometry contentPadding,
    Color color,

    /// 是否允许输入空格，默认为允许，通过_NotAllowSpaceInputFormatter实现
    bool allowSpace = true,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      autofocus: true,
      controller: controller,
      obscureText: obscureText,
      maxLength: maxLength,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(),
        prefixIconConstraints: BoxConstraints(),
        hintText: hintText,
        counterText: '',
        fillColor: color,
        filled: true,
        // errorBorder: _border(),
        // focusedBorder: _border(),
        // focusedErrorBorder: _border(),
        // enabledBorder: _border(),
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 16,
          color: ColorUtil.setColor('#999999'),
        ),
      ),
      inputFormatters: allowSpace ? null : [NotAllowSpaceInputFormatter()],

      // 校验
      // validator: (v) {
      //   return v.trim().length > 0  null : "不能为空";
      // },
    );
  }

  //TextField左边的控件(用户名，密码等)
  static Widget head(String title) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  //TextFeild右边的控件(发送验证码)
  static Widget end(String tralling, Function f) {
    return GestureDetector(
      onTap: () {
        f();
      },
      child: Text(
        tralling,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  //TextFeild的边框设置
  static _border() {
    return UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.black12),
    );
  }

  static Widget text(
    String text, {
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color,
    TextStyle textStyle,
    int maxLines,
    TextOverflow overflow,
  }) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: textStyle ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
    );
  }

  static textSpan(
    String text, {
    TextStyle textStyle,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.bold,
    Color color,
    TextDecoration decoration,
    List<TextSpan> children,
    GestureRecognizer recognizer,
  }) {
    return TextSpan(
      text: text,
      children: children,
      recognizer: recognizer,
      style: textStyle ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            decoration: decoration,
          ),
    );
  }

  // 渐变色按钮
  static Widget gradientButton(String label, {@required Function onPressed}) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            ColorUtil.setColor('#0084FF'),
            ColorUtil.setColor('#425CFC'),
          ]), // 渐变色
          borderRadius: BorderRadius.circular(25)),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.transparent,
        // 设为透明色
        elevation: 0,
        // 正常时阴影隐藏
        highlightElevation: 0,
        // 点击时阴影隐藏
        onPressed: () {
          onPressed();
        },
        child: Container(
          alignment: Alignment.center,
          child: MyWidget.text(label, color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }

  //描边的按钮
  static Widget strokeButton(String label, {@required Function onPressed}) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 0.5,
        ),
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.transparent,
        // 设为透明色
        elevation: 0,
        // 正常时阴影隐藏
        highlightElevation: 0,
        // 点击时阴影隐藏
        onPressed: () {
          onPressed();
        },
        child: Container(
          alignment: Alignment.center,
          child: MyWidget.text(label, color: Colors.blue, fontSize: 13),
        ),
      ),
    );
  }

  static Widget myListTile(Widget left, Widget right) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        left,
        right,
      ],
    );
  }
}

/// 不允许输入空格
class NotAllowSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
