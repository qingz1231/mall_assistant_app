class Bookmark {
  int? bookmarkId;
  int? itemId;
  int? customerId;
  int? category;
  DateTime? timestamp;

  // Constructor
  Bookmark({
    this.bookmarkId,
    this.itemId,
    this.customerId,
    this.category,
    this.timestamp,
  });

  // Factory method to create a Bookmark instance from JSON
  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      bookmarkId: json['bookmarkId'],
      itemId: json['itemId'],
      customerId: json['customerId'],
      category: json['category'],
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : null,
    );
  }

  // Convert Bookmark instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'bookmarkId': bookmarkId,
      'itemId': itemId,
      'customerId': customerId,
      'category': category,
      'timestamp': timestamp?.toIso8601String(),
    };
  }
}
