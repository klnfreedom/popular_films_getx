import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:film_app_getx/app/modules/detailPage/controllers/detail_page_controller.dart';

class DetailPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DetailPageController>(
        builder: (controller) {
          return controller.resultOfFilmDetail == null
              ? controller.startDownloading()
              : NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor: Colors.deepOrangeAccent,
                        expandedHeight: 200.0,
                        centerTitle: true,
                        floating: false,
                        pinned: false,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          background: Image.network(
                            controller.pathToBackDropPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ];
                  },
                  body: buildBody20(),
                );

        },
      ),
    );
  }

  Widget buildBody20() {
    DetailPageController controller = Get.find<DetailPageController>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              controller.resultOfFilmDetail.title,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  fontSize: 23,
                  color: Colors.deepOrangeAccent),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              controller.resultOfFilmDetail.originalTitle,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  controller.resultOfFilmDetail.voteAverage.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                RatingBar.builder(
                  itemSize: 12.0,
                  initialRating: controller.movieRatings,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1),
                  onRatingUpdate: (double value) {
                    print(value);
                  },
                  itemBuilder: (controller, int index) => Icon(
                    Icons.star,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              "ОПИСАНИЕ",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                fontSize: 18,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              controller.resultOfFilmDetail.overview,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "БЮДЖЕТ",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.resultOfFilmDetail.budget.toString() + "\$",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ПРОДОЛЖИТЕЛЬНОСТЬ",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.resultOfFilmDetail.runtime.toString() +
                          " минут",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ДАТА ВЫХОДА",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.resultOfFilmDetail.releaseDate,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
