import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:telephony/telephony.dart';

class Otp_Design extends StatefulWidget {
  const Otp_Design({super.key});

  @override
  State<Otp_Design> createState() => _Otp_DesignState();
}

class _Otp_DesignState extends State<Otp_Design> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final Telephony telephony = Telephony.instance;
  String textReceived = " ";

  void startListening() {
    print("OPt");
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          print("opt message");
          if (message.body!.contains("shangar-app")) {
            String otpCode = message.body!.substring(0, 6);
            print(otpCode);
            setState(() {
              _otpController.text = otpCode;
              textReceived = message.body.toString();
              _pinController.text = otpCode;
            });
          }
        },
        listenInBackground: false);
  }

  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    startListening();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
    _verifyOtp();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _verifyOtp() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: '+91 1111 111 11',
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

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            const Text("VERIFICATION"),
            const SizedBox(
              height: 15,
            ),
            const Text("Enter the code sent to your mobile number"),
            const SizedBox(
              height: 15,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                separatorBuilder: (index) => const SizedBox(width: 5),
                pinAnimationType: PinAnimationType.scale,
                readOnly: false,
                length: 6,
                keyboardType: TextInputType.number,
                controller: pinController,
                animationCurve: Curves.bounceIn,
                animationDuration: Durations.extralong1,
                autofillHints: const [
                  AutofillHints.oneTimeCode,
                ],
                validator: (value) {
                  return value == '123456' ? null : 'Pin is incorrect';
                },
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 2,
                      color: Colors.pink,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
                textInputAction: TextInputAction.next,
                showCursor: true,
                // validator: (s) {
                //   print('validating code: $s');
                // },
                // onCompleted: null,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                focusNode.unfocus();
                formKey.currentState!.validate();
              },
              child: const Text('Validate'),
            ),
            TextField(
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      controller: _otpController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "mobile number",
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
          ]),
        ),
      ),
    );
  }
}
