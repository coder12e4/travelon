part of 'verify_otp_cubit.dart';

@immutable
abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}
class VerifyOtpLoading extends VerifyOtpState {}
class VerifyOtpSuccess extends VerifyOtpState {
  final verifyModel obj;

  VerifyOtpSuccess(this.obj);
}
class VerifyOtpError extends VerifyOtpState {}
