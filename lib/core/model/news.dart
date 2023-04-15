class News {
  final int? id;
  final String? sourceName;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  String category;

  News({
    this.id,
    this.sourceName,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.category = '',
  });

  factory News.fromMap(Map<String, dynamic> map, [String? category]) {
    return News(
      id: map['source']['id'],
      sourceName: map['source']['name'],
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      category: category ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'source': {
        'id': id,
        'name': sourceName,
      },
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'category': category,
    };
  }
}
