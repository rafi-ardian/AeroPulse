import 'package:air_quality_apps/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/magazinescreen_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MagazinescreenView extends GetView<MagazinescreenController> {
  const MagazinescreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MagazinescreenController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: whiteSmoke,
        centerTitle: true,
        title: Text(
          'NEWS',
          style: regulerText35.copyWith(color: blackColor),
        ),
      ),
      body: Obx(() {
        if (controller.newsList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: controller.newsList.length,
          itemBuilder: (context, index) {
            var newsItem = controller.newsList[index];
            return GestureDetector(
              onTap: () async {
                final Uri uri = Uri.parse("${newsItem["url"]}");
                if (!await launchUrl(uri)) {
                  throw Exception('Could not launch $uri');
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                width: Get.width,
                height: Get.height / 5,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: Get.width / 3.5,
                        height: Get.height / 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: newsItem["image"] != null
                                ? DecorationImage(
                                    image: NetworkImage("${newsItem["image"]}"),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: AssetImage("assets/icons/sad.png"),
                                    fit: BoxFit.cover))),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        newsItem["title"],
                        style: regulerText17.copyWith(color: blackColor),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
