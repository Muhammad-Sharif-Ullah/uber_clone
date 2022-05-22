import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:uber_clone/app/BloC/bloc/phone_auth/phone_auth_bloc.dart';

class OtpWidget extends StatelessWidget {
  OtpWidget(
      {Key? key, required this.codeController, required this.verificationId})
      : super(key: key);
  final TextEditingController codeController;
  final String verificationId;
  final GlobalKey<FormState> _otpFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _otpFormKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFieldPinAutoFill(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter OTP',
                prefixIcon: Icon(Icons.message),
              ),
              codeLength: 6,

              onCodeSubmitted: (code) {
                print.call("onCodeSubmitted => $code");
              },
              onCodeChanged: (code) {
                if (code.length == 6) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
              //code submitted callback
              // onCodeChanged: //code changed callback
              // codeLength: //code length, default 6
            ),
            // TextFormField(
            //   keyboardType: TextInputType.number,
            //   controller: codeController,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: 'Enter OTP',
            //     prefixIcon: Icon(Icons.message),
            //   ),
            //   validator: (value) {
            //     if (value!.length != 6) {
            //       return 'Please enter valid OTP';
            //     }
            //     return null;
            //   },
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            // ),
            //
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  if (_otpFormKey.currentState!.validate()) {
                    _verifyOtp(context: context);
                  }
                },
                child: const Text('Verify OTP'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyOtp({required BuildContext context}) {
    context.read<PhoneAuthBloc>().add(VerifySentOtpEvent(
        otpCode: codeController.text, verificationId: verificationId));
    codeController.clear();
  }
}
