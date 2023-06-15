import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travlon/models/fpswdOTP.dart';

import '../../repository/otpVerifyRepo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final  otpVerify objotpverify;
  VerifyOtpCubit(VerifyOtpState state,this.objotpverify) : super(VerifyOtpInitial());
  String otp = "";
 Future<void>verifyOTP(String otp)async{
   try {
     emit(VerifyOtpLoading());
     verifyModel objverify = await objotpverify.newOTP(otp);
     if (objverify.success!) {
       emit(VerifyOtpSuccess(objverify));
     } else {
       emit(VerifyOtpError());
     }
   } catch(e){
     emit(VerifyOtpError());
     print(e);
     emit(VerifyOtpInitial());
   }
 }
}

