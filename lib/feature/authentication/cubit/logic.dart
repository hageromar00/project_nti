import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nti_app/feature/authentication/cubit/states.dart';

import '../models/user_model.dart';
import '../service/firebase_services.dart';


class UserCubit extends Cubit<UserState> {
  final FirebaseService _firebaseService;

  UserCubit(this._firebaseService) : super(UserInitial());


  Future<void> signUp(String name, String email, String password) async {
    emit(UserLoading());
    try {
      final user = await _firebaseService.signUp(
        name: name,
        email: email,
        password: password,
      );
      emit(UserSuccess(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(UserLoading());
    try {
      final user = await _firebaseService.signIn(email, password);
      emit(UserSuccess(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }


  Future<void> updateFavList(UserModel user, List<String> favList) async {
    emit(UserLoading());
    try {
      await _firebaseService.updateFavList(user.id, favList);
      final updatedUser = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        password: user.password,
        favList: favList,
      );
      emit(UserSuccess(updatedUser));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }



  Future<void> signOut() async {
    emit(UserLoading());
    try {
      await _firebaseService.signOut();
      emit(UserLoggedOut());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
