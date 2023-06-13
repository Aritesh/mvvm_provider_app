import 'package:flutter/cupertino.dart';

import '../../data/response/api_response.dart';
import '../../respository/home_repository.dart';
import '../model/movies_model.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<TipDataModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<TipDataModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviewListApi(Map<String, String> map) async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMovieList(map).then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
