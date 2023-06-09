import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travlon/models/otpModel.dart';

import '../../models/registermodel.dart';
import '../../repository/registerRepo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  registerRepo objrepo;

  RegisterCubit(RegisterState state, this.objrepo) : super(RegisterInitial());

  Future<void> regFinal(
    String name,
    String email,
    String address,
    int pin,
    var dob,
    int mob,
    String BG,
    var passWord,
    var Confirmpassword,
    int otp,
  ) async {
    try {
      emit(RegisterLoading());
      registerModel objregister = await objrepo.register(name, email, address,
          pin, dob, mob, BG, passWord, Confirmpassword, otp);
      emit(RegisterSuccess(objregister));
    } catch (e) {
      emit(RegisterError());

      print(e);
    }
  }
  // otp senting funtion
Future<void>sentOtp(String email)async{
    try{
      emit(otpRegLoading());
      optModel obj=await objrepo.sentOtp(email);
      emit(otpRegSuccess());
    }catch(e){
      emit(otpRegError());
      print(e);
      emit(otpRegInitial());

    }
}



}
