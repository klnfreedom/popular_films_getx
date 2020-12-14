import 'package:film_app_getx/app/modules/detailPage/data/film_repo.dart';
import 'package:film_app_getx/app/modules/detailPage/data/model/film_response_model.dart';
import 'package:film_app_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class DetailPageController extends GetxController {
  final FilmRepo _filmRepo;

  MovieDetailResponse resultOfFilmDetail;

  List<Genres> resultOfGenres = List<Genres>().obs;

  //String pathToPosterPath = "".obs.value;
  String pathToBackDropPath = "".obs.value;

  double movieRatings;


  int id = Get.find<HomeController>().id;


  DetailPageController(this._filmRepo);

  Future<void> getFilmDetail() async {
    MovieDetailResponse response = await _filmRepo.getFilmDetail(id);
    if (response != null) {
      resultOfFilmDetail = response;
      resultOfGenres.addAll(resultOfFilmDetail.genres);
      getBackDropPath(resultOfFilmDetail.backdropPath);
      initialRating();
      update();
    }
  }
  void getBackDropPath(String backDropPath) {
    pathToBackDropPath = 'https://image.tmdb.org/t/p/w500' + backDropPath;
  }

  void initialRating() {
    movieRatings = resultOfFilmDetail.voteAverage / 2;
  }

  Widget startDownloading() {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          backgroundColor: Colors.deepOrangeAccent,
        ),
      ),
    );
  }

  @override
  // ignore: must_call_super
  void onInit() {
    getFilmDetail();
  }

  @override
  // ignore: must_call_super
  void onReady() {}

  @override
  void onClose() async{}
}