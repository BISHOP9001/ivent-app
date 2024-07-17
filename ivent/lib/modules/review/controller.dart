import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent/data/models/review.dart';
import 'package:ivent/data/models/user.model.dart';
import 'package:ivent/data/providers/auth.provider.dart';
import 'package:ivent/data/repository/auth.repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent/data/providers/review.provider.dart';
import 'package:ivent/data/repository/review.repository.dart';

class ReviewController extends GetxController {
  final ReviewRepository reviewRepository = ReviewRepository(ReviewProvider());
  var reviews = <Review>[].obs;
  var isLoading = true.obs;
  TextEditingController ratingController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  Future<void> fetchReviews(int eventId) async {
    try {
      isLoading.value = true;
      var fetchedReviews = await reviewRepository.list(eventId);
      reviews.assignAll(fetchedReviews);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error fetching reviews: $e");
    }
  }

  Future<void> submitReview(int eventId) async {
    try {
      isLoading.value = true;
      var review = Review(
        eventId: eventId,
        rating: int.parse(ratingController.text),
        comment: commentController.text,
      );
      await reviewRepository.create(review);
      await fetchReviews(eventId);
      isLoading.value = false;
      Get.snackbar('Success', 'Review submitted successfully');
    } catch (e) {
      isLoading.value = false;
      print("Error submitting review: $e");
      Get.snackbar('Error', 'Failed to submit review');
    }
  }
}
