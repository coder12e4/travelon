import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
      emit(RegLoading());
      registerModel objregister = await objrepo.register(name, email, address,
          pin, dob, mob, BG, passWord, Confirmpassword, otp);
      emit(RegSuccess(objregister));
    } catch (e) {
      print(e);
    }
  }
}
