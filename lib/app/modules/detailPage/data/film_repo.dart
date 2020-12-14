import 'dart:convert';
import 'package:film_app_getx/app/modules/detailPage/api/api_tmdb_film.dart';
import 'package:film_app_getx/app/modules/detailPage/data/model/film_response_model.dart';
import '../../../constants.dart';

abstract class FilmRepo {
  getFilmDetail(int movieId);
}

class FilmRepoImpl implements FilmRepo {
  var _api = ApiTmpbForFilm();

  @override
  Future<MovieDetailResponse> getFilmDetail(int movieId) async {
    var resultForFilm = await _api.getFilm(
        FILM_URL_FIRST_PART + movieId.toString() + FILM_URL_SECOND_PART);

    if (resultForFilm != null) {
      var data = json.decode(resultForFilm);
      MovieDetailResponse movie = MovieDetailResponse.fromJson(data);
      return movie;
    } else {
      return null;
    }
  }
}