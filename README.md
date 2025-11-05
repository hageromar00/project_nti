# 🛍️ Final Project NTI – Flutter E-Commerce App

## 🚀 Overview
This is a **Flutter e-commerce mobile application** developed as part of the NTI training program.  
The app provides a simple and clean shopping experience — users can browse products, view details, mark favorites, and manage orders easily.

---

## ✨ Features
- 🧭 **Splash & Onboarding Screens**
- 👤 **User Authentication** (Sign Up / Sign In / Logout)
- 🏠 **Home Screen** showing all products
- ❤️ **Favorites Section** to save preferred items
- 🛒 **Product Details** with image, price, description
- 🔍 **Filter & Search** functionality
- ⚙️ **Firebase Integration** for backend
- 📱 Responsive design for both Android and iOS

---

## 🧰 Technologies & Tools

| Category | Technology |
|-----------|-------------|
| Framework | Flutter (Dart) |
| State Management | BLoC |
| Backend | Firebase (Auth + Firestore) |
| Local Storage | Hive |
| Version Control | Git & GitHub |
| IDE | Android Studio / VS Code |

---

## 📁 Project Structure

```plaintext
lib/
│
├── core/
│   ├── color_manager/
│   │   └── color_manager.dart
│   ├── firebase/
│   │   └── firebase_db.dart
│   ├── routes/
│   │   └── app_routes.dart
│   ├── utils/
│   │   └── size_config.dart
│   ├── Widget/
│   │   ├── button_1.dart
│   │   └── custom.dart
│   └── theme/
│
├── feature/
│   ├── auth/
│   │   ├── login/
│   │   │   └── login_screen.dart
│   │   ├── signup/
│   │   │   └── signup_screen.dart
│   │   ├── models/
│   │   │   └── user_model.dart
│   │   ├── widget/
│   │   │   ├── custom_another_account.dart
│   │   │   ├── custom_app_bar.dart
│   │   │   ├── custom_container_image.dart
│   │   │   └── custom_text_field.dart
│   │   └── cubit/
│   │       ├── logic.dart
│   │       └── states.dart
│   │
│   ├── favorite_screen/
│   │   ├── favorite_screen.dart
│   │   └── widgets/
│   │       ├── buy_now_button.dart
│   │       ├── favorite_category_selector.dart
│   │       └── favorite_screen.dart
│   │
│   ├── home/
│   │   ├── custom_bottom_navigation_bar.dart
│   │   └── widget/
│   │       └── home.dart
│   │
│   ├── home_screen/
│   │   ├── home_screen_product.dart
│   │   ├── widget/
│   │   │   ├── category_selector.dart
│   │   │   ├── custom_home_app.dart
│   │   │   ├── custom_search_filter.dart
│   │   │   ├── favorite_toggle_icon.dart
│   │   │   └── filter_bottom_sheet.dart
│   │   ├── cubit/
│   │   │   ├── product_cubit.dart
│   │   │   └── product_state.dart
│   │   └── model/
│   │       └── product_model.dart
│   │
│   ├── notification_screen/
│   │   └── notification_screen.dart
│   │
│   ├── onboarding_screen/
│   │   ├── onboarding_screen.dart
│   │   └── widget/
│   │       └── custom_slider_image.dart
│   │
│   ├── order_details/
│   │   ├── order_details.dart
│   │   └── widget/
│   │       ├── address_card.dart
│   │       ├── custom_button.dart
│   │       ├── custom_row_status.dart
│   │       ├── custom_status.dart
│   │       ├── order_card.dart
│   │       ├── payment.dart
│   │       └── section_tile.dart
│   │
│   ├── profile_screen/
│   │   └── profile_screen.dart
│   │
│   ├── show_product_details/
│   │   └── product_details_view.dart
│   │
│   └── splash_screen/
│       └── splash_screen.dart
│
├── main.dart
└── firebase_options.dart
