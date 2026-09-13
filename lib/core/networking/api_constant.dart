// core/networking/api_constant.dart
class ApiConstants {
  static const baseUrl = 'https://movie-platform1.runasp.net/';
  static const String login = 'api/Account/login';
  static const String register = 'api/Account/register';
  static const String resetPasswordrequest = 'api/Account/Sendcode';
  static const String verifyCode="api/Account/VerifyCode";
  static const String resetNewPass="api/Account/ResetPassword";
   static const String getMovie="api/Movie/GetAll";
   static const String toogleFav="api/Favorits";
      static const String isFav="api/Favorits";
      static const String getUserFav="api/Favorits";
      static const String addToCart="api/Cart";
      static const String GetCartMovie="api/Cart";
      static const String deleteMovie="api/Cart";
      static const String checkout="api/Checkout";
      static const String watchMovie="api/Movie/watch";
      static const String getMovieReviewStatus="api/Review/status";
      static const String getMovieReview="api/Review/movie";
      static const String deleteMovieReview="api/Review";
      static const String addRev="api/Review";
      
   

}
class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
 
}
