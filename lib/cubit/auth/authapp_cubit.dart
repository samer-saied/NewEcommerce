import 'package:bloc/bloc.dart';
import 'package:ecommerceproject/services/AppConnectServ.dart';
import 'package:ecommerceproject/services/FirebaseConnect.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'authapp_state.dart';

class AuthappCubit extends Cubit<AuthappState> {
  AuthappCubit() : super(AuthappInitial());

  AuthappCubit get(context) => BlocProvider.of(context);
  Future<void> loginMethod(
      {@required String emailText, @required String passwordText}) async {
    // 1- Login to FireBase Service

    // 2- Get User
    // 3- save User Data to DataBase
    // 4- save User Data to SharedRefrence
    try {
      await FirebaseService.signInWithEmailAndPassword(
          emailText: '$emailText', passwordText: '$passwordText');
    } catch (error) {
      throw error;
    }
  }
}
