import 'package:film_app_getx/app/modules/home/data/popular_film_repo.dart';
import 'package:get/get.dart';
import 'package:film_app_getx/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(PopularFilmsRepoImpl()),
    );
  }
}