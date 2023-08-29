import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'getcurrent_location_state.dart';

class GetcurrentLocationCubit extends Cubit<GetcurrentLocationState> {
  GetcurrentLocationCubit() : super(GetcurrentLocationInitial());

  void loadlocationsNear(){
    emit(GetcurrentLocationLoading());
   Future.delayed(Duration(seconds: 0),(){
     emit(GetcurrentLocationSuccess());
   });

   }

}
