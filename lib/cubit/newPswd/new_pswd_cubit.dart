import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/newPswd.dart';
import '../../repository/newpswdRepo.dart';

part 'new_pswd_state.dart';

class NewPswdCubit extends Cubit<NewPswdState> {
  final newpswdRepo objnewpswdrepo;

  NewPswdCubit(NewPswdState state, this.objnewpswdrepo)
      : super(NewPswdInitial());

  String password = "";
  String confirmPassword= "";

  Future<void> getNewPswd(
      String email, String newPswd, String confirmPswd) async {
    try {
      emit(NewPswdLoading());
      newPswdModel objnewpswd = await objnewpswdrepo.newpswd(email, newPswd, confirmPswd);
      if (objnewpswd.success!) {
        emit(NewPswdSuccess(objnewpswd));
      } else {
        emit(NewPswdError());
      }
    } catch (e) {
      emit(NewPswdError());
      print(e);
      emit(NewPswdInitial());
    }
  }
}
