class Review {
  int? id;
  int? userId;
  int? eventId;
  String? review;
  int? rating;
  String? comment;

  Review({
    this.id,
    this.userId,
    this.eventId,
    this.review,
    this.rating,
    this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      userId: json['user_id'],
      eventId: json['event_id'],
      review: json['review'],
      rating: json['rating'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'event_id': eventId,
      'review': review,
      'rating': rating,
      'comment': comment,
    };
  }
}
