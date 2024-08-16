import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Otp_Design extends StatefulWidget {
  const Otp_Design({super.key});

  @override
  State<Otp_Design> createState() => _Otp_DesignState();
}

class _Otp_DesignState extends State<Otp_Design> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
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
                validator: (s) {
                  // print('validating code: $s');
                },
                onCompleted: null,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Verify"),
            ),
          ]),
        ),
      ),
    );
  }
}
