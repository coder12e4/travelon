import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travlon/models/nearplacesModel.dart';

import '../../repository/nearbyrepo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final nearbyrepo objnearbyrepo;
  HomeCubit(HomeState state, this.objnearbyrepo) : super(HomeInitial());
  Future<void>nearby()async{
    emit(HomeLoading());
    nearbyModel objnearby = await objnearbyrepo.nearbylist();
    emit(HomeSuccess(objnearby));
  }



}
