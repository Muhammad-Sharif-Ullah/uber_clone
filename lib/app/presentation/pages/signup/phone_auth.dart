import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/phone_auth/phone_auth_bloc.dart';
import 'package:uber_clone/app/presentation/pages/home/home_page.dart';
import 'package:uber_clone/app/presentation/pages/signup/widget/otp_widget.dart';
import 'package:uber_clone/app/presentation/pages/signup/widget/phone_number_widget.dart';
import 'package:uber_clone/app/routes/route_name.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController otp = TextEditingController();
  CountryCode countryCode =
      CountryCode(name: "Bangladesh", dialCode: "+880", code: "bd");

  @override
  void dispose() {
    phoneNumber.dispose();
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state is PhoneAuthVerified) {
            print.call("[LOG] Verified");
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }

          // Show error message if any error occurs while verifying phone number and otp code
          if (state is PhoneAuthError) {
            print.call(state.error);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          // if (state is PhoneAuthInitial) {
          //   return buildInitialView(context);
          // }
          // else if(state is PhoneAuthError){
          //
          // }
          if (state is PhoneAuthLoading) {
            return buildWaitForOTP(context);
          }
          // if (state is PhoneAuthVerified) {
          //   return buildAuthCompleted();
          // } else if (state is PhoneAuthCodeSentSuccess) {
          //   return buildTypeOtp(context);
          // } else if (state is PhoneAuthLoading) {
          //   return buildWaitForOTP(context);
          // }
          return buildInitialView(context, state);
        },
      ),
    );
  }

  Column buildWaitForOTP(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Phone Authentication With Firebase",
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20)),
        const SizedBox(height: 20),
        Text("Please wait for OTP",
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15)),
        const SizedBox(height: 20),
        const Padding(
            padding: EdgeInsets.all(20),
            child:  LinearProgressIndicator()),
      ],
    );
  }

  Column buildTypeOtp(BuildContext context) {
    return Column(
      children: [
        Text("Phone Authentication With Firebase",
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20)),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "OTP"),
          ),
        ),
      ],
    );
  }

  Container buildAuthCompleted() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(),
        shape: BoxShape.circle,
      ),
      child:
          const Center(child: Icon(Icons.done, color: Colors.indigo, size: 70)),
    );
  }

  Column buildInitialView(BuildContext context, PhoneAuthState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Phone Authentication with Firebase",
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20)),
        const SizedBox(height: 20),
        if (state is! PhoneAuthCodeSentSuccess)
          PhoneNumberWidget(
            phoneNumberController: phoneNumber,
          )
        else
          OtpWidget(
            codeController: otp,
            verificationId: state.verificationId,
          ),
        // Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         shape: BoxShape.rectangle,
        //         border: Border.all(color: Colors.indigo)),
        //     child: Row(
        //       children: [
        //         CountryCodePicker(
        //           onChanged: (CountryCode code) {
        //             print.call(code);
        //             setState(() {
        //               countryCode = code;
        //             });
        //           },
        //           // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
        //           initialSelection: 'bd',
        //           showCountryOnly: false,
        //           // optional. Shows only country name and flag when popup is closed.
        //           showOnlyCountryWhenClosed: false,
        //           // optional. aligns the flag and the Text left
        //           alignLeft: false,
        //         ),
        //         Expanded(
        //           child: TextFormField(
        //             controller: phoneNumber,
        //             keyboardType: TextInputType.number,
        //             decoration:
        //                 const InputDecoration(border: InputBorder.none),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
        //

        // else
        //   Padding(
        //     padding: const EdgeInsets.all(20),
        //     child: TextFormField(
        //       keyboardType: TextInputType.number,
        //       decoration: const InputDecoration(
        //           border: OutlineInputBorder(), hintText: "OTP"),
        //     ),
        //   ),
        // ElevatedButton(
        //     onPressed: () => sentOTP(context), child: const Text("Send OTP")),
      ],
    );
  }

  sentOTP(BuildContext context) {
    final phoneNumberWithCode = "${countryCode.dialCode}${phoneNumber.text}";
    print.call("==============$phoneNumberWithCode================");
    context.read<PhoneAuthBloc>().add(
          SendOtpToPhoneEvent(
            phoneNumber: phoneNumberWithCode,
          ),
        );
    setState(() {
      phoneNumber.clear();
    });
  }

  verifyOTP(String verificationId) {
    context.read<PhoneAuthBloc>().add(
        VerifySentOtpEvent(otpCode: otp.text, verificationId: verificationId));
    otp.clear();
  }
}
