part of 'phone_auth_bloc.dart';

abstract class PhoneAuthEvent extends Equatable {
  const PhoneAuthEvent();
}


/// [Send OTP]
// This event will be triggered when the user enters the phone number
// and presses the Send OTP button on the UI.
// Once Send Otp button is pressed we will send
// the phone number with the event to the bloc
class SendOtpToPhoneEvent extends PhoneAuthEvent{
  final String phoneNumber;
  const SendOtpToPhoneEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [];
}

///[OTP Field to Type]
// Once the user requested the OTP after entering the phone number,
// the OTP field will get appeared on the screen.
// After the OTP is entered by the user this event will get fired.
class VerifySentOtpEvent extends PhoneAuthEvent {
  final String otpCode;
  final String verificationId;

  const VerifySentOtpEvent(
      {required this.otpCode, required this.verificationId});

  @override
  List<Object> get props => [otpCode, verificationId];
}


// After the user request the OTP from the server,
// the Firebase will send the OTP
// to the user's phone number. Firebase will send the token,
// verificationId with the response.
// This verificationId is then used to log in to the user.
class OnPhoneOtpSent extends PhoneAuthEvent {
  final String verificationId;
  final int? token;
  const OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });

  @override
  List<Object> get props => [verificationId];
}


// This event will be triggered when an error occurs
// while sending the OTP to the user's phone number.'
// ' This can be due to network issues or firebase's error.
class OnPhoneAuthErrorEvent extends PhoneAuthEvent {
  final String error;
  const OnPhoneAuthErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}


// This event will be triggered when the verification of the OTP is successful.
class OnPhoneAuthVerificationCompleteEvent extends PhoneAuthEvent {
  final AuthCredential credential;
  const OnPhoneAuthVerificationCompleteEvent({
    required this.credential,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
