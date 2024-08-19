import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
  
}
  final TextEditingController _otpController = TextEditingController();


class _LoginState extends State<Login> {
  
  void initState() {
    super.initState();
    // startListening();
    // formKey = GlobalKey<FormState>();
    // pinController = TextEditingController();
    // focusNode = FocusNode();
    _verifyOtp();
  }

    

    void _verifyOtp() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: '+91 1111 111 111',
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = '123456';
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('Auto-retrieval timeout: $verificationId');
      },
    );
  }
  //   void initState() {
  //   super.initState();

  //   _otpController.addListener(() {
  //     // print("123456");
  //     // print(_otpController.text);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                 textInputAction: TextInputAction.next,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                style: GoogleFonts.outfit(
                  color: const Color(0xFF373737),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                // controller: emailController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter Mobile Number",
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
              
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed("/otp_Design");
                  },
                  child: Text('pinput')),
            ],
          ),
        ),
      ),
    );
  }
}
