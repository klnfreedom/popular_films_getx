import 'package:film_app_getx/app/modules/detailPage/data/film_repo.dart';
import 'package:get/get.dart';
import 'package:film_app_getx/app/modules/detailPage/controllers/detail_page_controller.dart';

class DetailPageBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailPageController(
        FilmRepoImpl(),
      ),
    );
  }
}
