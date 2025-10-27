class Urls{
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String loginUrl = '$_baseUrl/auth/login';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String homeSlidersUrl = '$_baseUrl/slides';
  static String categoryListUrl(int pageSize,int pageNo) => '$_baseUrl/categories?count=$pageSize&page=$pageNo';
  static String productListUrl(int pageSize,int pageNo,String categoryId) => '$_baseUrl/products?count=$pageSize&page=$pageNo&category=$categoryId';
  static String reviewListUrl(int pageSize,int pageNo,String productId) => '$_baseUrl/reviews?count=$pageSize&page=$pageNo&product=$productId';
  static String prouductDetailsUrl(String productId)=> '$_baseUrl/product/id/$productId';
  static String deleteWishItemUrl(String wishId)=> '$_baseUrl/wishlist/$wishId';
  static const String addToCartUrl= '$_baseUrl/cart';
  static const String wishListUrl= '$_baseUrl/wishlist';
  static const String cartListUrl= '$_baseUrl/cart';
  static const String addReviewUrl= '$_baseUrl/review';
  static String deleteCartItemUrl(String cartItemId)=> '$_baseUrl/cart/$cartItemId';
  static String productListByTagUrl(String tag)=> '$_baseUrl/products?tag=$tag';

}