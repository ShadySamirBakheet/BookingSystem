import 'package:bloc/bloc.dart';
import 'package:booking_system/data/models/users/user.dart';

import 'package:booking_system/data/repository/database_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  User? user;
  DatabaseRepository databaseRepository;
  UserCubit(
    this.databaseRepository,
  ) : super(UserInitial());

  authFun(User user, bool isLoing) {
    emit(UserLoading());
    if (isLoing) {
      _loginFun(user);
    } else {
      _signUpFun(user);
    }
  }

  _loginFun(User user) {
    databaseRepository.userLogin(user.email)!.then((value) {
      if (value != null && value.password == user.password) {
        Future.delayed(Duration.zero, () async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setBool('isLogin', true);
          sharedPreferences.setInt('uid', value.uid ?? 0);
        });
        emit(UserLogin(user: value));
      } else {
        emit(UserError(error: 'Parameter Errors'));
      }
    });
  }

  getUseeFun(int uid) {
    databaseRepository.getUser(uid)!.then((value) {
      if (value != null) {
        user = value;
        emit(UserLogin(user: value));
      } else {
        emit(UserError(error: 'Parameter Errors'));
      }
    });
  }

  _signUpFun(User user) {
    databaseRepository.userSignUp(user)!.then((value) {
      if (value != null) {
        Future.delayed(Duration.zero, () async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setBool('isLogin', true);
          sharedPreferences.setInt('uid', value.uid ?? 0);
        });
        emit(UserLogin(user: value));
      } else {
        emit(UserError(error: 'Parameter Errors'));
      }
    });
  }

  updateUserFun(User user) {
    databaseRepository.userUpdate(user)!.then((value) {
      if (value != null) {
        Future.delayed(Duration.zero, () async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setBool('isLogin', true);
          sharedPreferences.setInt('uid', value.uid ?? 0);
        });
        emit(UserLogin(user: value));
      } else {
        emit(UserError(error: 'Parameter Errors'));
      }
    });
  }
}
