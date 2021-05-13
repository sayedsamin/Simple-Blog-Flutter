import 'package:flutter/material.dart';
import 'blogModel.dart';

class BlogDetails extends StatelessWidget {
  final Blogs detailedBlog;

  BlogDetails(this.detailedBlog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      detailedBlog.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    subtitle: Text('written by: ' +
                        detailedBlog.author.name +
                        ', ' +
                        detailedBlog.author.profession),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(detailedBlog.coverPhoto),
                  ),
                  ListTile(
                    title: Text(
                      detailedBlog.description,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        for (var categ in detailedBlog.categories)
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            child: Text(categ),
                          )
                      ]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
