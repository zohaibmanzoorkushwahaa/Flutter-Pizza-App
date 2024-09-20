# 🍕 Pizza App – Flutter, Firebase, Bloc, & Clean Architecture

**Pizza App** is a Flutter mobile application designed to offer a sleek and intuitive pizza ordering experience. It uses **Firebase Authentication** for secure login and registration, and follows the **Bloc pattern** with **Clean Architecture** principles for maintainable, scalable, and testable code. Users can browse a variety of pizzas on the home screen and navigate to a detailed view for each pizza.

## 🌟 Key Features:
- **Firebase Authentication:** Secure user registration, login, and sign-out powered by Firebase.
- **Bloc State Management:** Ensures a predictable and scalable approach to managing app state.
- **Clean Architecture:** Organized codebase with separation of concerns, making it easy to extend and maintain.
- **Home Screen:** Displays a list of pizzas with names and images.
- **Pizza Detail Screen:** Provides detailed information for each selected pizza.
- **Smooth Navigation:** User-friendly navigation between home and detail screens.

## 🔧 Tech Stack:
- **Flutter:** Cross-platform app development framework.
- **Firebase Authentication:** For user authentication.
- **Bloc (Business Logic Component):** For efficient state management.
- **Clean Architecture:** Promotes a layered and maintainable code structure.
- **Firebase Firestore:** (Optional) For pizza data storage.

## 🛠 Project Structure:
This app follows **Clean Architecture** principles, organized into layers:
1. **Presentation Layer:** Handles UI and state management using **Bloc**.
2. **Domain Layer:** Contains business logic and use cases.
3. **Data Layer:** Manages API interactions and data models (e.g., Firebase).

## 🚀 Getting Started:
1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/pizza_app.git
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Configure Firebase:**
   - Set up Firebase for both Android and iOS.
   - Replace the `google-services.json` and `GoogleService-Info.plist` with your Firebase credentials.

4. **Run the app:**
   ```bash
   flutter run
   ```

## 📱 Screenshots:

<img src="https://github.com/user-attachments/assets/9127c073-2490-4d2e-9e18-8945cafb8c94" alt="Simulator Screenshot - iPhone 15 Pro Max" width="400" />
<img src="https://github.com/user-attachments/assets/9ef5dad4-0710-4518-b145-7c203b334cc9" alt="Simulator Screenshot - iPhone 15 Pro Max" width="400" />

## 🤝 Contribution:
Contributions are welcome! Feel free to open issues, submit pull requests, or suggest features.
