import 'package:flutter/material.dart';
import 'package:pfcalulator/screens/widgets/show_result.dart';

import '../../style/colors.dart';

class ResultView extends StatelessWidget {
  const ResultView(
      {Key? key, required this.result, required this.resText, required this.unit})
      : super(key: key);
  final String resText;
  final double result;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: red,
            border: Border.all(
              color: red,
            ),
            borderRadius: const BorderRadius.all( Radius.circular(5),),
          boxShadow:const [
          BoxShadow(
          color: Colors.black,
          offset:  Offset(0.0, 0.0), //(x,y)
            spreadRadius: 0.2,
          blurRadius: 0.5,
        )],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                  textDirection: TextDirection.ltr,
                  border:  const TableBorder(
                      verticalInside: BorderSide(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid)),
                  defaultVerticalAlignment:
                  TableCellVerticalAlignment.middle,
                  children: [
                TableRow(
                    children: [
                      TableCell(
                        child:Text(resText, style:  const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                      ),
                      TableCell(
                        child:Text(" $result  $unit",
                            textAlign: TextAlign.end,
                            style:   const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ]),

              ]),
            ),

          ],
        ),
      ),
    );
  }
}

class ResultWithDialogView extends StatelessWidget {
  const ResultWithDialogView(
      {Key? key, required this.result, required this.title, required this.unit})
      : super(key: key);
  final String title;
  final String result;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all( Radius.circular(5),),
          boxShadow:const [
            BoxShadow(
              color: Colors.transparent,
              offset:  Offset(0.0, 0.0), //(x,y)
              spreadRadius: 0.2,
              blurRadius: 0.5,
            )],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                  textDirection: TextDirection.ltr,
                  border:    TableBorder(
                      verticalInside: BorderSide(
                          width: 1,
                          color: red,
                          style: BorderStyle.solid)),
                  defaultVerticalAlignment:
                  TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                        children: [
                          TableCell(
                            child:Text(title, style:    TextStyle(
                                color: red,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                          ),
                          ShowResult(
                            result: result,
                            title: title,
                            unit: unit,
                          ),
                        ]),

                  ]),
            ),

          ],
        ),
      ),
    );
  }
}

class TableElementView extends StatelessWidget {
  const TableElementView({Key? key, required this.result, required this.resText})
      : super(key: key);
  final String resText;
  final Widget result;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                color: red,
                border: Border.all(
                  color: red,
                ),
                borderRadius: const BorderRadius.all( Radius.circular(5),),
                boxShadow:const [
                  BoxShadow(
                    color: Colors.black,
                    offset:  Offset(0.0, 0.0), //(x,y)
                    spreadRadius: 0.2,
                    blurRadius: 0.5,
                  )],
              ),
              child: result),
        ),
      ],
    );
  }
}

class BorderedResultOld extends StatelessWidget {
  const BorderedResultOld(
      {Key? key, required this.result, required this.resText, required this.unit})
      : super(key: key);
  final String resText;
  final double result;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 40,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: greenDark,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
        ),
        Positioned(
          left: 50,
          top: 12,
          child: Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30),
              shape: BoxShape.rectangle,
            ),
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Text(
              resText,
              style: TextStyle(
                  color: black, fontSize: 11, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(" $result  $unit"),
            )),
      ],
    );
  }
}

class BorderedResult2 extends StatelessWidget {
  const BorderedResult2({Key? key, required this.result, required this.resText})
      : super(key: key);
  final String resText;
  final Widget result;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 160,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: greenDark,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
        ),
        Positioned(
          left: 50,
          top: 10,
          child: Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30),
              shape: BoxShape.rectangle,
            ),
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Text(
              resText,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(child: result),
        ),
      ],
    );
  }
}
