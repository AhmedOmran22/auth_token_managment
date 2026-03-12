# Auth Token Management in Flutter 🚀

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green.svg?style=for-the-badge)

A professional, clean, and scalable Flutter project designed specifically for **developers learning token-based authentication flows in Flutter**. This project serves as an excellent reference and boilerplate, with a heavy focus on **clean architecture, scalability, and developer experience**.

---

## 📖 Project Overview

This app demonstrates a complete authentication flow including login, registration, and secure token handling. A key highlight is the background handling of token expiration via an HTTP interceptor, ensuring users remain authenticated seamlessly using refresh tokens without manual re-login.

---

## ✨ Features

- **User Authentication:** Secure Login and Registration flows.
- **Token Management:** Proper handling and secure storage of both Access Tokens and Refresh Tokens.
- **Automatic Token Refresh (HTTP Interceptor):** Custom HTTP interceptors to silently catch `401 Unauthorized` errors and refresh expired access tokens without interrupting the user experience.
- **State Management:** Predictable and scalable state management using **Cubit** (Bloc pattern).
- **Theming & UI:** Polished, responsive UI with seamless support for both **Light & Dark Mode**.
- **Skeleton Loading:** Premium user experience with shimmer/skeleton loading states during data fetches.

---

## 📸 Screenshots / UI Highlights

*(Replace these image placeholders with actual screenshots of your app)*

| Login Screen | Dark Mode | Skeleton Loading |
| :---: | :---: | :---: |
| <img src="assets/screenshots/login.png" width="200" alt="Login Screen"/> | <img src="assets/screenshots/dark_mode.png" width="200" alt="Dark Mode"/> | <img src="assets/screenshots/loading.png" width="200" alt="Skeleton Loader"/> |

---

## 🚀 Installation / Setup Instructions

Follow these steps to get the project up and running on your local machine.

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/auth_token_managment.git
   cd auth_token_managment
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Environment Variables (Optional but recommended):**
   Set up your API base URLs in your configuration or constant files. Ensure your backend server is running and accessible.

4. **Run the app:**
   ```bash
   flutter run
   ```

---

## 💡 Usage / How it works

### The Interceptor & Refresh Token Flow
This project is built to handle access token expiration gracefully for maximum developer and user experience:
1. **Initial Login:** When a user logs in, the app receives and securely stores an **Access Token** and a **Refresh Token**.
2. **Authenticated Requests:** Every subsequent API request includes the Access Token in the `Authorization` header.
3. **Token Expiration Handling:** If an API request fails with a `401 Unauthorized` status (indicating an expired Access Token), the custom HTTP Interceptor instantly intercepts the error.
4. **Silent Refresh:** The Interceptor pauses the failed request and automatically sends a background request to the refresh endpoint using the stored Refresh Token.
5. **Resume Flow:** Upon receiving a new Access Token, the Interceptor updates the local storage, attaches the new token to the paused request, and retries it. **The user experiences zero interruption.** 
6. **Session Expiry:** If the Refresh Token itself is also expired, the user is cleanly logged out, their states are cleared, and they are redirected to the Login Screen.

---

## 🏗 Architecture & Folder Structure

The project follows a clean and modular folder structure to separate concerns and improve maintainability:

```text
lib/
 ┣ core/               # App-wide utilities, themes, networking, interceptors, constants
 ┣ data/               # Models, repositories, and local/remote data sources
 ┣ logic/              # Cubits and application state management
 ┣ presentation/       # UI layer: Screens, widgets, and skeleton loaders
 ┗ main.dart           # Entry point of the application
```
*(Note: Please adapt this structure visually if your exact implementation differs slightly)*

---

## 🤝 Contribution Guidelines

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---
*Built with ❤️ for Flutter Developers.*
