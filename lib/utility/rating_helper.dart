import '../models/review.dart';

class RatingHelper {
  double generateRating(List<Review> reviews) {
    print(reviews.length);
    int _acceptRating = reviews.length * 5;
    print("Accept Rating: $_acceptRating");
    int _actualRating = 0;
    for (var review in reviews) {
      _actualRating = _actualRating + review.rate!;
    }

    // Calculate the actual rating
    double _ratioRating = 0;
    if (reviews.length > 0) {
      return _ratioRating = (_actualRating / _actualRating) * 5;
    }
    return 0;
  }
}
