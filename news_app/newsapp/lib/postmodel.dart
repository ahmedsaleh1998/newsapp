class Post {
  String source, author, title, description, urlToImage, publishedAt, content;
  Post(
      {this.author,
      this.description,
      this.publishedAt,
      this.title,
      this.urlToImage});
  factory Post.fromjson(Map<String, dynamic> json) {
    return Post(
      author: json['author'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      title: json['title'],
      urlToImage: json['urlToImage'],
    );
  }
}
