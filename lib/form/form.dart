// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Funcation extends StatefulWidget {
  const Funcation({super.key});

  @override
  State<Funcation> createState() => _FuncationState();
}

final myController = TextEditingController();

// bool _flag = true;

class _FuncationState extends State<Funcation> {
  // final FocusNode _nameFocusNode = FocusNode();
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _numberController = TextEditingController();
  final numbersController = TextEditingController();
  final numberController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    // myController.addListener(_printLatestValue);
  }

  //  void _printLatestValue() {
  //   final text = myController.text;
  //   print('Second text field: $text (${text.characters.length})');
  // }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("data"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: numbersController,
                  // focusNode: _nameFocusNode,
                  // controller: _nameController,
                  // textInputAction: TextInputAction.next,
                  // keyboardType: TextInputType.name,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onSubmitted: (_) {
                    // FocusScope.of(context).requestFocus(_nameFocusNode);
                  },
                  // controller(): myController,
                  // canRequestFocus: bool.hasEnvironment('flutter_test'),
                  cursorColor: const Color.fromARGB(255, 185, 135, 6),
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF373737),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),

                  // controller: passwordController,
                  // obscureText: !showPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility_off
                          // showPassword ? Icons.visibility : Icons.visibility_off,
                          // color: const Color.fromARGB(255, 59, 59, 59),
                          ),
                      onPressed: () {},
                    ),
                    hintText: "number",
                    hintStyle: GoogleFonts.outfit(
                      color: const Color(0xFF9A9A9A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD2D2D2)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF155092)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: numberController,
                  // keyboardType: TextInputType.number,
                  // textInputAction: TextInputAction.next,
                  //  focusNode: _nameFocusNode,
                  // controller: _numberController,
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF373737),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  // controller: passwordController,
                  // obscureText: !showPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility_off
                          // showPassword ? Icons.visibility : Icons.visibility_off,
                          // color: const Color.fromARGB(255, 59, 59, 59),
                          ),
                      onPressed: () {
                        setState(() {
                          // showPassword = !showPassword;
                        });
                      },
                    ),
                    hintText: "number",
                    hintStyle: GoogleFonts.outfit(
                      color: const Color(0xFF9A9A9A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD2D2D2)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF155092)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    // onHover: (e) {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.amber),
                      overlayColor: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.redAccent; //<-- SEE HERE
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    // style: ButtonStyle(
                    //   animationDuration: ScrollDragController
                    //       .momentumRetainStationaryDurationThreshold,
                    //   mouseCursor: WidgetStateMouseCursor.clickable,
                    //   backgroundColor:
                    //       const WidgetStatePropertyAll(Colors.amber),
                    //   overlayColor: WidgetStateProperty.all(Colors.blue),
                    // ),
                    // style: ElevatedButton.styleFrom(
                    //   // shape: CircleBorder(),
                    //   // enabledMouseCursor:Colors.blue;
                    //    backgroundColor: Colors.black,
                    //       // backgroundColor: _flag ? Colors.red : Colors.teal,
                    //   // backgroundColor: Color.fromARGB(0, 121, 185, 26),
                    //   iconColor: Color.fromARGB(255, 230, 147, 5),
                    //   shadowColor: Color(0xFF155092),
                    //   // foregroundColor:Color.fromARGB(255, 73, 3, 50),
                    //   // disabledForegroundColor:Color.fromARGB(255, 41, 19, 207),
                    //   //  overlayColor: Color.fromARGB(255, 79, 146, 21),
                    //    disabledBackgroundColor:Color.fromARGB(255, 196, 196, 19),
                    //    surfaceTintColor:Color.fromARGB(255, 10, 130, 100),

                    // ),
                    onPressed: () {
                      //  print(nameController.text);
                      print(numbersController.text);

                      print(numberController.text);
                      final int number1 = int.parse(numbersController.text);
                      final int number2 = int.parse(numberController.text);
                      print("Number 1 : $number1");
                      print("Number 2 : $number2");
                      final sum = number1 - number2;
                      print("Sum : $sum");

                      numbersController.clear();
                      numberController.clear();},
                    child: const Text(
                      "submit",
                      style: TextStyle(color: Colors.white),
                    )),
                // const TextField(
                //   obscureText: true,
                //   decoration: InputDecoration(
                //       border: InputBorder.none,
                //       labelText: 'Enter Name',
                //       hintText: 'Enter Your Name'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
