import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travlon/repository/loginrepository.dart';

import '../../models/loginmodel.dart';

part 'logincubit_state.dart';

class LogincubitCubit extends Cubit<LogincubitState> {

  final loginRepo objloginrepo;
  LogincubitCubit(LogincubitState state,this.objloginrepo) : super(LogincubitInitial());

  Future <void>login(String email,String password,double lat,double long,double km)async {
try{
  emit(LogincubitLoading());
  loginModel objNew =await objloginrepo.login(email, password, lat, long, km);
  emit(LogincubitSuccess(objNew));
}catch (e){
  emit(LogincubitError());
  print(e);
  emit(LogincubitInitial());
}




}


}
