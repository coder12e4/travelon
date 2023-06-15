import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_pswd_state.dart';

class NewPswdCubit extends Cubit<NewPswdState> {
  NewPswdCubit() : super(NewPswdInitial());
}
