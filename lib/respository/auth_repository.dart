import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiServices.dart';
import '../../model/user_model.dart';
import '../../res/app_url.dart';
import '../model/otp_verify_model.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<UserModel> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.validateMobile, data);
      print(response);
      return response = UserModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<OTPVerifyModel> verifyOtp(data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.otpUrl, data);
      print(response);
      // log(response);
      return response = OTPVerifyModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
