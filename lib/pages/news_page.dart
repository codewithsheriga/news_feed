import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewsDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String publishedAt;
  final String author;
  final String imageUrl;
  final String content;
  const NewsDetailPage(
      {required this.title,
      required this.description,
      required this.publishedAt,
      required this.author,
      required this.imageUrl,
      required this.content});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            expandedHeight: 300,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.black38, Colors.black],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter)
                        .createShader(bounds),
                    blendMode: BlendMode.darken,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 180, right: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.newspaper_sharp,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.author,
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              widget.publishedAt,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "News Content",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(widget.content)
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
