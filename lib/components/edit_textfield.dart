import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/colors.dart';


class EditText extends StatelessWidget {
  const EditText({
    Key? key,
    required this.labelText,
    this.controller,
    this.textHint,
    required this.validate,
    this.maxLines,
    this.maxInputText,
  }) : super(key: key);
  final String? labelText;
  final String? textHint;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final int? maxLines;
  final int? maxInputText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: TextFormField(
          expands: true,
          maxLines: null,
          minLines: null,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxInputText),
            FilteringTextInputFormatter.deny(RegExp('[A-Za-z!@#%\$|_*/&*]')),
            FilteringTextInputFormatter.allow(RegExp(r'^(?:-?[0-9]+)?(?:.[0-9]*)?(?:[eE][+-]?[0-9]+)?')),

          //  FilteringTextInputFormatter.allow( RegExp(r"^[+|-]?((\d*\.?\d+)|(\d+\.?\d*))$")),

            //FilteringTextInputFormatter.allow( RegExp(r'^-?\d{0,5}')),
          ],
          validator: validate,
          textInputAction: TextInputAction.next,
          keyboardType: const TextInputType.numberWithOptions(
              decimal: true, signed: true),
          autovalidateMode: AutovalidateMode.disabled,
          controller: controller,
          cursorColor: red,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            filled: true,
            fillColor: Colors.white,
            errorStyle: const TextStyle(
                height: 0.1,
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: red,
                width: 3.0,
              ),
            ),
            focusColor: red,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: red, width: 6.0),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: red, width: 1.0),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: red, width: 1.0),
            ),
            hintStyle: GoogleFonts.kodchasan(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textHintColor,
            ),
            hintMaxLines: maxLines,
            hintText: textHint,
            labelText: labelText,
            labelStyle: TextStyle(
                color: red.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class EditText2 extends StatelessWidget {
  const EditText2({
    Key? key,
    required this.labelText,
    this.controller,
    this.textHint,
    required this.validate,
    this.maxLines,
  }) : super(key: key);
  final String? labelText;
  final String? textHint;
  final TextEditingController? controller;
  final FormFieldValidator? validate;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: SizedBox(
        width: 250,
        height: 50,
        child: TextFormField(
          validator: validate,
          keyboardType: TextInputType.number,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            errorStyle: const TextStyle(
              fontSize: 10,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: red,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: greenDark, width: 2.0),
            ),
            focusColor: red,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: red, width: 2.0),
            ),
            label: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: Text(
                  labelText!,
                )),
            labelStyle: TextStyle(
                background: Paint()..color = Colors.blue,
                color: red,
                fontSize: 13,
                fontWeight: FontWeight.bold),
            hintStyle: const TextStyle(
              fontSize: 10,
            ),
            hintMaxLines: maxLines,
            hintText: textHint,
          ),
        ),
      ),
    );
  }
}
