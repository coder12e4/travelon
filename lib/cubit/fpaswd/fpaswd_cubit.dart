import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travlon/models/fpswdModel.dart';

import '../../repository/fpswdRepo.dart';

part 'fpaswd_state.dart';

class FpaswdCubit extends Cubit<FpaswdState> {
 final fpswdRepo objrepo;
  FpaswdCubit(FpaswdState state,this.objrepo) : super(FpaswdInitial());
String email="";
  Future<void> otpSend(String email)async{
    try{
      emit(FpaswdLoading());
      fpswdModel obj =await objrepo.newPswd(email);
      emit(FpaswdSuccess(obj));
    }catch(e){
      emit(FpaswdError());
      print(e);
      emit(FpaswdInitial());
    }
  }


}
