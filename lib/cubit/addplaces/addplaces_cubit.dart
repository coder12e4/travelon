import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travlon/models/addpalceModel.dart';

import '../../repository/addplacesRepo.dart';

part 'addplaces_state.dart';

class AddplacesCubit extends Cubit<AddplacesState> {
  final addplaceRepo objaddplaceRepo;
  AddplacesCubit(AddplacesState state, this.objaddplaceRepo) : super(AddplacesInitial());

  Future<void>addPlacesNew(
      String name,String place,String details,String address,String country,String district,String state,String lat,String long
      )async{
    
    try{
      emit(AddplacesLoading());
      addplaceModel objNew= await objaddplaceRepo.newPlaces(name, place, details, address, country, district, state, lat, long);
    emit(AddplacesSuccess(objNew));
    }catch(e){
      emit(AddplacesError());
      print(e);
    }
  }





}
