import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travlon/repository/loginrepository.dart';

part 'logincubit_state.dart';

/*class LogincubitCubit extends Cubit<LogincubitState> {

  final loginRepo objloginrepo;
  LogincubitCubit(LogincubitState state,this.objloginrepo) : super(LogincubitInitial());

  Future <void>login(String username,String password)async {
emit(LogincubitLoading());
loginModel objlogin=await objloginrepo.loginToaccount( username, password);
emit(LogincubitSuccess(objlogin));




}


}*/
