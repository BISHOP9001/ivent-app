import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent/modules/review/controller.dart';

class ReviewPage extends GetView<ReviewController> {
  final int eventId;

  ReviewPage({required this.eventId});

  @override
  Widget build(BuildContext context) {
    controller.fetchReviews(eventId);

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.reviews.length,
              itemBuilder: (context, index) {
                final review = controller.reviews[index];
                return ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rating: ${review.rating}'),
                      Text('Comment: ${review.comment}'),
                    ],
                  ),
                );
              },
            ),
          ),
          TextFormField(
            controller: controller.ratingController,
            decoration: InputDecoration(labelText: 'Rating (1-5)'),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: controller.commentController,
            decoration: InputDecoration(labelText: 'Comment'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.submitReview(eventId);
            },
            child: Text('Submit Review'),
          ),
        ],
      ),
    );
  }
}
