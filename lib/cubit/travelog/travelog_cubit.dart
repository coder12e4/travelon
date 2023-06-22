import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travlon/models/travelogModel.dart';

import '../../repository/travelogRepo.dart';

part 'travelog_state.dart';

class TravelogCubit extends Cubit<TravelogState> {
  final travelogRepo objtravelrepo;

  TravelogCubit( TravelogState state,   this.objtravelrepo) : super(TravelogInitial());

  Future<void>newTravelog( String heading, String lat, String long, String content, String remark)async{
    try{
      emit(TravelogLoading());
      travelogModel obj = await objtravelrepo.newTravelog(heading, lat, long, content, remark);
      emit(TravelogSuccess(obj));
    }catch(e){
      emit(TravelogError());
      print(e);
      emit(TravelogInitial());
    }
  }






}
