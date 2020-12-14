import 'dart:convert';
import 'package:film_app_getx/app/modules/home/api/api_tmdb_popular_movies.dart';
import '../../../constants.dart';
import 'model/popular_list_response_model.dart';

abstract class PopularFilmsRepo {
  getPopularFilmsList(int page);
}

class PopularFilmsRepoImpl implements PopularFilmsRepo {
  var _api = ApiTmpbForPopularList();

  @override
  Future<List<Results>> getPopularFilmsList(int page) async {
    var resultForPop = await _api.getFilms(POPULAR_FILMS_URL + page.toString());
    if (resultForPop != null) {
      var data = json.decode(resultForPop);
      List<Results> results = PopularFilmsApiResultModel.fromJson(data).results;
      return results;
    } else {
      return null;
    }
  }
}
