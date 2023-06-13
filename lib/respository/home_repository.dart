import '../../model/movies_model.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<TipDataModel> fetchMovieList(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.getTip, data);
      print(response);
      return response = TipDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
