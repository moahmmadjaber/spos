import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spos/Data/model/home/home_model.dart';
import 'package:spos/Data/repository/home/home_repository.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository repository;
  HomeCubit(this.repository) : super(HomeInitial());
  Future<void> getData() async{
    try{
      emit(HomeLoading());
      HomeModel res = await repository.getData();
      emit(HomeComplete(res));

    }catch(ex){
      emit(HomeError(ex.toString()));

    }
  }
}