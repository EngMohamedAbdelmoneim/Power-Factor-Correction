import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../style/colors.dart';


class Drop2 extends StatefulWidget {
  Drop2({Key? key, required this.unit}) : super(key: key);
  TextEditingController unit = TextEditingController();

  @override
  State<Drop2> createState() => _Drop2State();
}

class _Drop2State extends State<Drop2> {
  final List<String> items = [
    'kw',
    'hp',
    'kva',
  ];


  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 165,
          child:DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint:  Row(
                children:  [
                  Icon(
                    Icons.list,
                    size: 16,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      'Select Unit',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;


                });
              },
              buttonStyleData: ButtonStyleData(
                height: 50,
                width: 160,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  color: greenDark,
                ),
                elevation: 2,
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: Colors.green,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  padding: null,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: greenDark,
                  ),
                  elevation: 8,
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  )),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),

      ),
    );
  }
}
class Drop1 extends StatefulWidget {
  Drop1({Key? key}) : super(key: key);
  String? selectedValue;
  @override
  State<Drop1> createState() => _Drop1State();
}

class _Drop1State extends State<Drop1> {
  final List<String> items = [
    'Star',
    'Delta',
  ];


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 165,
        child:DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: const [
                Icon(
                  Icons.list,
                  size: 16,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Capacitor Connection',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ))
                .toList(),
            value: widget.selectedValue,
            onChanged: (value) {
              setState(() {
                widget.selectedValue = value as String;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: greenDark,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.green,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 200,
                padding: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: greenDark,
                ),
                elevation: 8,
                offset: const Offset(-20, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(6),
                  thumbVisibility: MaterialStateProperty.all(true),
                )),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),

      ),
    );
  }
}


class Drop3 extends StatefulWidget {
  Drop3({Key? key, required this.controller, required this.items, required this.selectedValue}) : super(key: key);
  TextEditingController controller ;
  List<String> items = [];
  String? selectedValue;
  @override
  State<Drop3> createState() => _Drop3State();
}

class _Drop3State extends State<Drop3> {



  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 165,
        child:DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: const [
                Icon(
                  Icons.list,
                  size: 16,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Select Unit',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: widget.items
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ))
                .toList(),
            value: widget.selectedValue,
            onChanged: (value) {
              setState(() {
                widget.selectedValue = value as String;


              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: greenDark,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.green,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 200,
                padding: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: greenDark,
                ),
                elevation: 8,
                offset: const Offset(-20, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(6),
                  thumbVisibility: MaterialStateProperty.all(true),
                )),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),

      ),
    );
  }
}