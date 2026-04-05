# Auth Token Management

A clean, scalable, and professional Flutter project focused on demonstrating robust token-based authentication flows. This project serves as a reference for developers learning how to handle secure authentication, state management, and seamless application networking in Flutter.

## Project Overview

The primary purpose of this application is to provide a complete, production-ready authentication flow. It showcases how to securely manage user sessions, handle token expiration gracefully in the background, and maintain predictable application state. The architecture prioritizes separation of concerns, making the codebase highly scalable, testable, and easy to maintain.

## Core Features

*   **User Authentication:** Complete Login and Registration flows.
*   **Token Management:** Secure handling and localized storage of both Access Tokens and Refresh Tokens.
*   **Automatic Token Refresh:** Custom HTTP interceptors that catch `401 Unauthorized` errors and seamlessly refresh tokens without interrupting the user's flow.
*   **State Management:** Predictable and structured state management using **Cubit** (Bloc pattern).
*   **Theming & UI:** Polished, clean user experience with native support for both **Light & Dark Mode**.

## How It Works: Developer Perspective

### The Interceptor & Refresh Token Flow

The core highlight of this project is its resilient network layer. To maximize the user experience and ensure uninterrupted sessions, token expiration is handled automatically:

1.  **Authentication:** Upon successful initial login or registration, the app securely stores both the `accessToken` and `refreshToken`.
2.  **Request Decoration:** An HTTP Interceptor automatically injects the `accessToken` into the `Authorization` header of all outgoing secure API requests.
3.  **Error Handling (401):** If a request fails with a `401 Unauthorized` status (indicating an expired access token), the interceptor catches the error before it propagates to the repository layer.
4.  **Silent Refresh:** The interceptor temporarily pauses the failed request and initiates a background call to the refresh endpoint using the stored `refreshToken`.
5.  **Resume Operations:** Once a new `accessToken` is successfully retrieved, the local token storage is updated, and the original queued request is retried with the new token. The end-user is completely unaware of this background process.
6.  **Session Terminated:** If the refresh token itself is expired or invalid, the interceptor triggers a clean logout process, clearing local states and routing the user back to the authentication screens.

### State Management (Cubit)

The application strictly separates UI components from business logic using **Cubit**. Each feature module (e.g., Auth, User Profile) is governed by its own functional Cubit, consistently emitting strongly-typed states (`Initial`, `Loading`, `Success`, `Failure`). This architecture guarantees predictable UI rendering and highly simplified unit testing.

## Architecture & Folder Structure

The project follows a modular, feature-based architecture pattern to promote clean code and separation of concerns.

```text
lib/
 ┣ core/               # App-wide configurations, network interceptors, themes, and constants
 ┣ data/               # Data Transfer Objects (DTOs), models, repositories, and API services
 ┣ logic/              # Cubits and application state management logic
 ┣ presentation/       # UI layer: Screens, custom reusable widgets, and dialogs
 ┗ main.dart           # Application entry point, thematic initialization, and dependency injection
```

## Installation & Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/AhmedOmran22/auth_token_managment.git
   ```
2. Navigate to the project directory:
   ```bash
   cd auth_token_managment
   ```
3. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```
