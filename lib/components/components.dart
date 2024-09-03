import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
void navigatepop(context) => Navigator.pop(context);
//////////////////////////////////////////////////
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);
//////////////////////////////////////////////////
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator validate,
  required String label,
  required IconData prefix,
  textInputAction = TextInputAction.none,
  Color borderColor = Colors.white,
  Color iconColor = Colors.black38,
  Color labelColor = Colors.black38,
  double elevation = 5,
  bool isPassword = false,
  Function(String)? onSubmit,
  IconData? suffix,
  Function? suffixPressed,
  Function()? onTap,
  Function(String)? onChange,
  bool isAutofocus = false,
}) =>
    Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(28)),
      elevation: elevation,
      child: TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: type,
        obscureText: isPassword,
        autofocus:  isAutofocus,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: borderColor,
              width: 2.0,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          errorStyle: const TextStyle(
            // fontSize: 9,
              height: .5
          ),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          // labelText: label,
          hintText: label,

          hintStyle:TextStyle(color: labelColor),
          prefixIcon: Icon(
            prefix,
            color:iconColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: () => suffixPressed!(),
            icon: Icon(
              suffix,
            ),
          )
              : null,
        ),

      ),
    );
////////////////////////////////////////////////////

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.white,
  bool isUpperCase = true,
  double radius = 50,
  required Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: 45.0,
      child: MaterialButton(
        elevation: 5,
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style:  TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
//////////////////////////////////////////////////
