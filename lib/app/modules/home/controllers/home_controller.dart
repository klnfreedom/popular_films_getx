import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:film_app_getx/app/modules/home/data/model/popular_list_response_model.dart';
import 'package:film_app_getx/app/modules/home/data/popular_film_repo.dart';
import 'package:film_app_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PopularFilmsRepo _repo;
  List<Results> listFilms = List<Results>();
  FlexibleSpaceBar flexBar;
  ScrollController scrollController;

  int id;
  int page = 0;
  bool isRequest = true;

  bool isInternet = true;

  HomeController(this._repo);

  Future<void> getFilmsPage() async {
    checkConnection();
    if (isRequest) {
      page++;
    }
    List<Results> resultsOfFilmsList = await _repo
        .getPopularFilmsList(page); //забираем результат списка фильмов
    if (resultsOfFilmsList != null) {
      listFilms.addAll(resultsOfFilmsList);
      isRequest = true;
      update();
    } else {
      isInternet = false;
    }
  }

  checkConnection() async {
    isInternet = await DataConnectionChecker().hasConnection;
    update();
  }

  void setTheme() {
    Get.isDarkMode
        ? Get.changeTheme(ThemeData.light())
        : Get.changeTheme(ThemeData.dark());
  }

  void goToDetailPage(int movieId) {
    id = movieId;
    Get.toNamed(Routes.DETAIL_PAGE);
  }



  String getBackDropPath(int index) {
    return 'https://image.tmdb.org/t/p/w500' + listFilms[index].backdropPath;
  }

  String getPosterPath(int index) {
    return 'https://image.tmdb.org/t/p/w500' + listFilms[index].posterPath;
  }

  void getScrollController() {
    scrollController = ScrollController();
  }

  void setListenerForScrollInTheEnd() {
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        getFilmsPage();
      }
    });
  }

  void setListenerForScrollButton() {
    scrollController.animateTo(scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  @override
  // ignore: must_call_super
  void onInit() {
    getFilmsPage();
    getScrollController();
    setListenerForScrollInTheEnd();
  }

  @override
  // ignore: must_call_super
  void onReady() {}

  @override
  Future<void> onClose() async {}
}
