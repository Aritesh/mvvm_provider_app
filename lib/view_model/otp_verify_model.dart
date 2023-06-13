import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../respository/auth_repository.dart';
import '../../view_model/user_view_model.dart';
import '../model/user_model.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class OTPVerifyModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    print(data);
    setLoading(true);
    _myRepo.verifyOtp(data).then((value) {
      setLoading(false);
      print(value.status);
      if (value.status.toString() == "true") {
        // print(value.data[0].deviceToken)
        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);
        userPreference
            .saveUser(UserModel(token: value.data?[0].deviceToken.toString()));
        Utils.flushBarErrorMessage('Login Successfully', context);
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.dashboard, (Route<dynamic> route) => false);
        if (kDebugMode) {
          print(value.toString());
        }
      } else {
        Utils.snakBar(value.message.toString(), context);
      }
      //   final userPreference = Provider.of<UserViewModel>(context, listen: false);
      // userPreference.saveUser(UserModel(token: value.token.toString()));
      // Utils.flushBarErrorMessage('Login Successfully', context);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
