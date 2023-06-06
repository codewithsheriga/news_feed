import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_feed/Pages/home_page.dart';

import '../controllers/news_controller.dart';
import '../widgets/newsCard.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 243, 252),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/newsNightLogo.png",
                height: 100,
                width: 100,
              ),
              Text("Top News")
            ],
          ),
        ),
        body: Obx(
          () => newsController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 2,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: newsController.newsArticles.length,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    title: newsController
                                        .newsArticles[index].title,
                                    description: newsController
                                        .newsArticles[index].description,
                                    imageUrl: newsController
                                            .newsArticles[index].urlToImage ??
                                        "",
                                    author: newsController
                                            .newsArticles[index].author ??
                                        "",
                                    publishedAt: newsController
                                        .newsArticles[index].publishedAt
                                        .toString(),
                                    content: newsController
                                        .newsArticles[index].content,
                                  ))),
                      child: NewsCard(
                          title: newsController.newsArticles[index].title,
                          description:
                              newsController.newsArticles[index].description,
                          imageUrl:
                              newsController.newsArticles[index].urlToImage ??
                                  "",
                          author:
                              newsController.newsArticles[index].author ?? "",
                          publishedAt: newsController
                              .newsArticles[index].publishedAt
                              .toString())),
                ),
        ));
  }
}
