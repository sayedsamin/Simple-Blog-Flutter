import 'package:flutter/material.dart';
import 'package:simple_blog/blogDetails.dart';
import 'services.dart';
import 'blogModel.dart';

class BlogCollection extends StatefulWidget {
  BlogCollection() : super();

  @override
  _BlogCollectionState createState() => _BlogCollectionState();
}

class _BlogCollectionState extends State<BlogCollection> {
  List<Blogs> _blogs;
  bool _loading;

  //Fetch the JSON data and attach the blogs
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getBlogs().then((blo) {
      setState(() {
        _blogs = blo.blogs;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Blog"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _blogs ? 0 : _blogs.length,
          itemBuilder: (context, index) {
            Blogs user = _blogs[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlogDetails(user)));
                    },
                    child: (Image(
                      image: NetworkImage(user.coverPhoto),
                    )),
                  ),
                  ListTile(
                    title: Text(user.title),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
