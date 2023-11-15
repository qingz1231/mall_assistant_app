class Bookmark {
  String? bookmarkId;
  String? itemId;
  String? customerId;
  String? category;
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
      bookmarkId: json['bookmark_id'],
      itemId: json['item_id'],
      customerId: json['customer_id'],
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
