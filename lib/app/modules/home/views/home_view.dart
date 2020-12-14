import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:film_app_getx/app/modules/home/controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "Popular FilmsX",
          style: GoogleFonts.bebasNeue(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return controller.listFilms.length > 1
              ? buildListPopularFilms()
              : startDownloading();
        },
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.keyboard_arrow_up),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.find<HomeController>().setListenerForScrollButton();
        },
      ),
    );
  }

  Widget buildListPopularFilms() {
    HomeController controller = Get.find();

    return ListView.builder(
      itemCount: controller.listFilms.length,
      controller: controller.scrollController,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () =>
              controller.goToDetailPage(controller.listFilms[index].id),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5),
            child: Container(
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 10,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            controller.getBackDropPath(index),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '${controller.listFilms[index].title}',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: Colors.deepOrangeAccent),
                    ),
                    subtitle: Text(
                      '${controller.listFilms[index].releaseDate}',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget startDownloading() {
    var controller = Get.find<HomeController>();
    return controller.isInternet != true
        ? AlertDialog(
            title: controller.listFilms.length == 0
                ? Text(
              'Нет соединения с интернетом',
            ) : Text(
              'Проблемы с сервером',
            ),
            actions: [
              RaisedButton(
                child: Text("Повторить попытку"),
                onPressed: () {
                  controller.getFilmsPage();
                },
              ),
            ],
          )
        : Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepOrangeAccent,
              ),
            ),
          );
  }
}
