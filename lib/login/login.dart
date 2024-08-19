import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Email Address',
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextField(
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      // controller: emailController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        hintStyle: GoogleFonts.outfit(
                          color: const Color(0xFF9A9A9A),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 189, 9, 96)),
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
                      height: 20,
                    ),
                    Text(
                      'Password',
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextField(
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
                        hintText: "Enter Password",
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
                      height: 36,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          // begin: Alignment.topRight,
                          // end: Alignment.bottomLeft,
                          // stops: [0.1, 0.5, 0.7, 0.9],
                          colors: [
                            Color(0xFF155092),
                            Color(0xFF14286A),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            const Color(0xFF155092),
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        // onPressed: isLoading ? null : _handleLogin,
                        // child: isLoading
                        // ?
                        onPressed: () {},
                        child:
                            // const SizedBox(
                            //     width: 20,
                            //     height: 20,
                            //     child: CircularProgressIndicator(
                            //       valueColor:
                            //           AlwaysStoppedAnimation<Color>(Colors.white),
                            //       strokeWidth: 2.0,
                            //     ),
                            //   )
                            Text(
                          "Sign In",
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          // begin: Alignment.topRight,
                          // end: Alignment.bottomLeft,
                          // stops: [0.1, 0.5, 0.7, 0.9],
                          colors: [
                            Color(0xFF155092),
                            Color(0xFF14286A),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            const Color.fromARGB(255, 88, 4, 70),
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        // onPressed: isLoading ? null : _handleLogin,
                        // child: isLoading
                        // ?
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed("/mapSample");
                          // Navigator.of(context).popAndPushNamed("/currentLocation");
                        },
                        child:
                            // const SizedBox(
                            //     width: 20,
                            //     height: 20,
                            //     child: CircularProgressIndicator(
                            //       valueColor:
                            //           AlwaysStoppedAnimation<Color>(Colors.white),
                            //       strokeWidth: 2.0,
                            //     ),
                            //   )
                            Text(
                          "mapping",
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 00,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).popAndPushNamed("/sample");
                          Navigator.of(context)
                              .popAndPushNamed("/currentLocation");
                        },
                        child: Text('fire_base')),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed("/otp");
                        },
                        child: Text('funcation')),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed("/otp_Design");
                        },
                        child: Text('pinput')),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      // controller: emailController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Enter your number",
                        hintStyle: GoogleFonts.outfit(
                          color: const Color(0xFF9A9A9A),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 189, 9, 96)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD2D2D2)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF155092)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
