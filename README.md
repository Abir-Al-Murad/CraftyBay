# 🛍️ CraftyBay - Modern eCommerce Application

CraftyBay is a comprehensive **Flutter-based eCommerce application** that provides a complete online shopping experience. Built with modern architecture and best practices, it offers seamless product browsing, secure authentication, cart management, and order processing.

---

## 📱 Download App Now

[![Download APK](https://img.shields.io/badge/Download-APK-brightgreen?style=for-the-badge&logo=android)](YOUR_APK_DOWNLOAD_LINK_HERE)

**Latest Version:** v1.0.0 | **Size:** ~XX MB | **Updated:** January 2024

### System Requirements:
- Android 7.0 (API level 24) or higher
- 100MB free storage space
- Internet connection required
- RAM: 2GB minimum, 3GB recommended

---

## 🚀 Features

### **🔐 Authentication System**
- **Secure Login & Sign Up:** Token-based authentication
- **Email Verification:** OTP-based email verification system
- **Profile Management:** Update user information and preferences
- **Password Reset:** Secure password recovery system
- **Session Management:** Automatic token refresh and persistence

### **🛍️ Shopping Experience**
- **Product Catalog:** Browse products by categories
- **Search & Filter:** Advanced search with filters
- **Product Details:** Comprehensive product information with images
- **Product Reviews:** Read and write product reviews
- **Related Products:** Smart product recommendations
- **Multiple Product Images:** Swipeable image gallery

### **🛒 Cart Management**
- **Add to Cart:** Easy product addition with quantity selection
- **Cart Summary:** Real-time price calculation
- **Quantity Update:** Modify product quantities
- **Remove Items:** Delete products from cart
- **Price Breakdown:** Detailed cost summary

### **❤️ Wishlist System**
- **Save Favorites:** Add products to wishlist
- **Quick Access:** Easy wishlist management
- **Move to Cart:** One-click move from wishlist to cart
- **Backend Sync:** Persistent wishlist across devices

### **📦 Order Management**
- **Order Placement:** Complete checkout process
- **Order History:** View past orders
- **Order Tracking:** Real-time order status
- **Order Details:** Comprehensive order information

### **🎨 User Interface**
- **Modern Design:** Clean, minimal interface
- **Responsive Layout:** Optimized for all screen sizes
- **Smooth Animations:** Fluid transitions and effects
- **Loading States:** Beautiful loading indicators
- **Error Handling:** User-friendly error messages

### **🌐 API Integration**
- **Real-time Data:** Live product and inventory updates
- **Backend Communication:** RESTful API integration
- **Error Recovery:** Robust error handling
- **Network Monitoring:** Connection status tracking

---

## 🏗️ Architecture

CraftyBay follows **Clean Architecture** principles for maintainability and scalability.

```
lib/
├── core/
│   ├── services/
│   │   ├── network_caller.dart        # HTTP request handler
│   │   ├── auth_service.dart          # Authentication logic
│   │   └── storage_service.dart       # Local storage
│   ├── utils/
│   │   ├── constants.dart             # App constants
│   │   ├── validators.dart            # Input validation
│   │   └── helpers.dart               # Helper functions
│   └── widgets/
│       ├── custom_button.dart         # Reusable buttons
│       ├── custom_textfield.dart      # Custom inputs
│       └── loading_indicator.dart     # Loading widgets
│
├── features/
│   ├── auth/
│   │   ├── models/
│   │   │   ├── user_model.dart
│   │   │   └── login_response.dart
│   │   ├── controllers/
│   │   │   ├── auth_controller.dart
│   │   │   └── profile_controller.dart
│   │   └── screens/
│   │       ├── login_screen.dart
│   │       ├── signup_screen.dart
│   │       ├── otp_verification_screen.dart
│   │       └── profile_screen.dart
│   │
│   ├── home/
│   │   ├── models/
│   │   │   ├── category_model.dart
│   │   │   ├── slider_model.dart
│   │   │   └── product_model.dart
│   │   ├── controllers/
│   │   │   └── home_controller.dart
│   │   └── screens/
│   │       ├── home_screen.dart
│   │       └── category_list_screen.dart
│   │
│   ├── products/
│   │   ├── models/
│   │   │   ├── product_details_model.dart
│   │   │   └── review_model.dart
│   │   ├── controllers/
│   │   │   ├── product_controller.dart
│   │   │   └── product_details_controller.dart
│   │   └── screens/
│   │       ├── product_list_screen.dart
│   │       └── product_details_screen.dart
│   │
│   ├── cart/
│   │   ├── models/
│   │   │   └── cart_item_model.dart
│   │   ├── controllers/
│   │   │   └── cart_controller.dart
│   │   └── screens/
│   │       └── cart_screen.dart
│   │
│   ├── wishlist/
│   │   ├── models/
│   │   │   └── wishlist_model.dart
│   │   ├── controllers/
│   │   │   └── wishlist_controller.dart
│   │   └── screens/
│   │       └── wishlist_screen.dart
│   │
│   └── orders/
│       ├── models/
│       │   └── order_model.dart
│       ├── controllers/
│       │   └── order_controller.dart
│       └── screens/
│           ├── checkout_screen.dart
│           └── order_history_screen.dart
│
└── main.dart                          # App entry point
```

---

## 📊 Technology Stack

### **Frontend Development**
- **Flutter SDK:** Cross-platform mobile framework
- **Dart:** Programming language
- **Material Design:** UI/UX framework

### **State Management**
- **GetX:** Reactive state management
- **Shared Preferences:** Local data persistence

### **Backend Integration**
- **RESTful API:** Standard HTTP communication

### **Network & API**
- **HTTP Package:** Network requests
- **JSON Serialization:** Data parsing

### **Storage & Caching**
- **Shared Preferences:** Lightweight local storage
- **Image Caching:** Network image optimization

### **Development Tools**
- **Git:** Version control
- **GitHub:** Code repository
- **Android Studio:** IDE
- **VS Code:** Alternative editor

### **Additional Features**
- **Firebase Crashlytics:** Error tracking (optional)
- **URL Launcher:** External link handling

---

## 🚀 Installation & Setup

### **Option 1: Download APK (Recommended for Users)**

1. **📱 Download the APK**
   - Click the download button above
   - Save the APK file to your device

2. **📲 Install the App**
   - Open the downloaded APK file
   - Allow installation from unknown sources
   - Complete installation

3. **🎯 Get Started**
   - Open CraftyBay
   - Sign up or log in
   - Start shopping!

### **Option 2: Build from Source (For Developers)**

#### **Prerequisites:**
- Flutter SDK (>=3.0.0)
- Android Studio / VS Code
- Git
- Android/iOS device or emulator

#### **Setup Steps:**

1. **📂 Clone the repository**
   ```bash
   git clone https://github.com/Abir-Al-Murad/craftybay.git
   ```

2. **📁 Navigate to project directory**
   ```bash
   cd craftybay
   ```

3. **📦 Install dependencies**
   ```bash
   flutter pub get
   ```

4. **⚙️ Configure API endpoint**
   
   Update the base URL in `lib/core/services/network_caller.dart`:
   ```dart
   static const String baseURL = 'YOUR_API_BASE_URL';
   ```

5. **▶️ Run the app**
   ```bash
   flutter run
   ```

---

## 🔧 API Configuration

### **Backend API Structure**

The app communicates with a RESTful API with the following endpoints:

```
Authentication:
POST   /api/auth/login          # User login
POST   /api/auth/register       # User registration
POST   /api/auth/verify-otp     # Email verification
POST   /api/auth/reset-password # Password reset

Products:
GET    /api/products            # Get all products
GET    /api/products/:id        # Get product details
GET    /api/products/category/:id # Products by category
GET    /api/products/search     # Search products

Cart:
GET    /api/cart                # Get cart items
POST   /api/cart/add            # Add to cart
PUT    /api/cart/update/:id     # Update cart item
DELETE /api/cart/remove/:id     # Remove from cart

Wishlist:
GET    /api/wishlist            # Get wishlist
POST   /api/wishlist/add        # Add to wishlist
DELETE /api/wishlist/remove/:id # Remove from wishlist

Orders:
GET    /api/orders              # Get order history
POST   /api/orders/create       # Create new order
GET    /api/orders/:id          # Get order details

User:
GET    /api/user/profile        # Get user profile
PUT    /api/user/profile        # Update profile
```



## 📱 Key Screens

### **Authentication Flow**
1. **Splash Screen** → App initialization
2. **Welcome Screen** → Onboarding
3. **Login Screen** → User authentication
4. **Sign Up Screen** → New user registration
5. **OTP Verification** → Email verification
6. **Home Screen** → Main dashboard

### **Shopping Flow**
1. **Home Screen** → Categories and featured products
2. **Category Screen** → Products by category
3. **Product List** → Browse all products
4. **Product Details** → Detailed product information
5. **Cart Screen** → Review cart items
6. **Checkout** → Complete order
7. **Order Confirmation** → Order success

---


### **Design Principles**
- **Minimalism:** Clean, clutter-free interface
- **Consistency:** Uniform design patterns
- **Accessibility:** High contrast, readable fonts
- **Responsiveness:** Adaptive layouts
- **Feedback:** Clear user action feedback

---

## 🧪 Testing

### **Manual Testing Checklist**

**Authentication:**
- ✅ User registration works correctly
- ✅ Login with valid credentials
- ✅ OTP verification functions properly
- ✅ Password reset works
- ✅ Token persistence across app restarts

**Products:**
- ✅ Products load correctly
- ✅ Product details display properly
- ✅ Images load and cache efficiently
- ✅ Search and filter work as expected

**Cart:**
- ✅ Add to cart functionality
- ✅ Quantity update works
- ✅ Remove from cart works
- ✅ Price calculation is accurate

**Orders:**
- ✅ Checkout process completes
- ✅ Order history displays correctly
- ✅ Order details are accurate

---

## 🐛 Troubleshooting

### **Common Issues:**

1. **API Connection Failed**
   - Check internet connection
   - Verify API base URL is correct
   - Ensure backend server is running

2. **Images Not Loading**
   - Check network connection
   - Verify image URLs are valid
   - Clear app cache and restart

3. **Login Issues**
   - Verify credentials are correct
   - Check if email is verified
   - Clear app data and try again

4. **Build Errors**
   - Run `flutter clean`
   - Delete `pubspec.lock` and run `flutter pub get`
   - Check Flutter SDK version compatibility

---

## 🔐 Security Features

### **Authentication Security**
- Token-based authentication with JWT
- Secure password storage
- Automatic token refresh
- Session timeout handling

### **Data Protection**
- HTTPS-only communication
- Input validation and sanitization
- SQL injection prevention
- XSS attack protection

### **Privacy**
- No sensitive data in logs
- Secure local storage
- Encrypted user credentials
- GDPR compliant data handling

---

## 🚀 Future Enhancements

### **Planned Features**
- 💳 **Payment Gateway Integration** (Stripe, PayPal)
- 📍 **Order Tracking** with real-time location
- 🔔 **Push Notifications** for order updates
- 🌙 **Dark Mode** theme support
- 🌍 **Multi-language Support**
- ⭐ **Product Rating System**
- 💬 **Live Chat Support**
- 🎁 **Discount Coupons** and promotions
- 📊 **Analytics Dashboard** for users
- 🤖 **AI Product Recommendations**

### **Technical Improvements**
- Offline mode with local caching
- Performance optimization
- Advanced error logging
- Automated testing suite
- CI/CD pipeline

---

## 🤝 Contributing

We welcome contributions! Follow these steps:

1. **Fork the repository**
2. **Create your feature branch**
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open a Pull Request**

### **Contribution Guidelines**
- Follow Flutter/Dart best practices
- Write clean, documented code
- Test thoroughly before submitting
- Follow the existing code style
- Update README if needed

---

## 📞 Support & Contact

For support, questions, or collaboration:

- 📧 **Email:** [abiralmuradnub@gmail.com](mailto:abiralmuradnub@gmail.com)
- 🐛 **GitHub Issues:** [Report Bug](https://github.com/Abir-Al-Murad/craftybay/issues)
- 💼 **LinkedIn:** [Abir Al Murad](https://www.linkedin.com/in/abir-al-murad)
- 🌐 **Portfolio:** [Your Portfolio Link]

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Flutter Team** for the amazing framework
- **GetX Team** for powerful state management
- **Backend API Provider** for reliable services
- **Open Source Community** for various packages
- **Design Inspiration** from leading eCommerce platforms

---

## ⭐ Show Your Support

If you find this project useful, please give it a star!

[![GitHub stars](https://img.shields.io/github/stars/Abir-Al-Murad/craftybay?style=social)](https://github.com/Abir-Al-Murad/craftybay/stargazers)

---

## 📈 Project Stats

![GitHub repo size](https://img.shields.io/github/repo-size/Abir-Al-Murad/craftybay)
![GitHub last commit](https://img.shields.io/github/last-commit/Abir-Al-Murad/craftybay)
![GitHub issues](https://img.shields.io/github/issues/Abir-Al-Murad/craftybay)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Abir-Al-Murad/craftybay)
![GitHub language count](https://img.shields.io/github/languages/count/Abir-Al-Murad/craftybay)
![GitHub top language](https://img.shields.io/github/languages/top/Abir-Al-Murad/craftybay)

---

**Last Updated:** January 2024 | **Version:** 1.0.0

*Made with ❤️ by [Abir Al Murad](https://github.com/Abir-Al-Murad)*
