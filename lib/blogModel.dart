class Blog {
  List<Blogs> _blogs;

  Blog({List<Blogs> blogs}) {
    this._blogs = blogs;
  }

  List<Blogs> get blogs => _blogs;
  set blogs(List<Blogs> blogs) => _blogs = blogs;

  Blog.fromJson(Map<String, dynamic> json) {
    if (json['blogs'] != null) {
      _blogs = new List<Blogs>();
      json['blogs'].forEach((v) {
        _blogs.add(new Blogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._blogs != null) {
      data['blogs'] = this._blogs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blogs {
  int _id;
  String _title;
  String _description;
  String _coverPhoto;
  List<String> _categories;
  Author _author;

  Blogs(
      {int id,
        String title,
        String description,
        String coverPhoto,
        List<String> categories,
        Author author}) {
    this._id = id;
    this._title = title;
    this._description = description;
    this._coverPhoto = coverPhoto;
    this._categories = categories;
    this._author = author;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get description => _description;
  set description(String description) => _description = description;
  String get coverPhoto => _coverPhoto;
  set coverPhoto(String coverPhoto) => _coverPhoto = coverPhoto;
  List<String> get categories => _categories;
  set categories(List<String> categories) => _categories = categories;
  Author get author => _author;
  set author(Author author) => _author = author;

  Blogs.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _coverPhoto = json['cover_photo'];
    _categories = json['categories'].cast<String>();
    _author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['cover_photo'] = this._coverPhoto;
    data['categories'] = this._categories;
    if (this._author != null) {
      data['author'] = this._author.toJson();
    }
    return data;
  }
}

class Author {
  int _id;
  String _name;
  String _avatar;
  String _profession;

  Author({int id, String name, String avatar, String profession}) {
    this._id = id;
    this._name = name;
    this._avatar = avatar;
    this._profession = profession;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  String get profession => _profession;
  set profession(String profession) => _profession = profession;

  Author.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _avatar = json['avatar'];
    _profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['avatar'] = this._avatar;
    data['profession'] = this._profession;
    return data;
  }
}