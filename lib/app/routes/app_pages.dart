import 'package:film_app_getx/app/modules/detailPage/bindings/detail_page_binding.dart';
import 'package:film_app_getx/app/modules/detailPage/views/detail_page_view.dart';
import 'package:film_app_getx/app/modules/home/views/home_view.dart';
import 'package:film_app_getx/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_PAGE,
      page:()=> DetailPageView(),
      binding: DetailPageBinding(),
    ),
  ];
}