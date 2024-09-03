import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/colors.dart';

class ShowResult extends StatefulWidget {
  const ShowResult({Key? key, required this.result, required this.title, required this.unit}) : super(key: key);
  final String result;
  final String title;
  final String unit;
  @override
  State<ShowResult> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context){
             return  AlertDialog(
                backgroundColor: red,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.title} :",
                      style: const TextStyle(color: Colors.yellow,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                         const Icon(
                          Icons.arrow_forward,
                          color: Colors.yellow,
                        ),
                        Text(
                          widget.result,
                          style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            });
      },
      child: Text("${widget.result} ${widget.unit}",maxLines: 1,overflow:TextOverflow.ellipsis ,textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: red
        ),
      )
    );
  }
}

