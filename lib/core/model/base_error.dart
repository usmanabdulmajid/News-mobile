class BaseError {
  String? title;
  String? description;
  BaseError({
    this.title = '',
    this.description = '',
  });

  BaseError copyWith({
    String? title,
    String? description,
  }) {
    return BaseError(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  String toString() => 'BaseError(title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseError &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
