import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spos/Data/model/login/user_model.dart';
import 'package:spos/Data/repository/login/login_repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository repository;
  LoginCubit(this.repository) : super(LoginInitial());
  Future<void> login(result) async{
    try{
      emit(LoginLoading());
      UserModel res = await repository.login(result);
      emit(LoginComplete(res));
    }catch(ex){
      emit(LoginError(ex.toString()));
    }
  }
}

