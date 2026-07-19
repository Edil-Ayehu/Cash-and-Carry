# Cash & Carry Smart Ordering System (iOS)

A modern iOS shopping application built with **SwiftUI**, following **MVVM + Repository + Dependency Injection (DI)** architecture. The application allows customers to browse products, discover events, manage their cart, and securely authenticate.

---

## ✨ Features

- 🔐 Authentication
  - Login
  - Register
  - Forgot Password
  - Reset Password
  - Logout

- 🛍️ Products
  - Fetch products from REST API
  - Product details
  - Network image loading
  - Skeleton loading UI
  - Category filtering (coming soon)

- 🛒 Shopping Cart
  - Add to Cart
  - Increase/Decrease Quantity
  - Remove Items
  - Local persistence using UserDefaults

- 🎉 Events
  - Upcoming events
  - Network image loading
  - Skeleton loading cards

- 👤 Profile
  - Customer information
  - Change Password
  - Logout

---

# Screenshots

| Login | Home | Register | Voucher |
|:------:|:----:|:--------:|:---------------:|
| ![Login](https://github.com/user-attachments/assets/3a6b2cbd-bd49-4bda-964d-a0d68309818f) | ![Home](https://github.com/user-attachments/assets/d88785b8-e74f-49d9-b9fb-42f9226372fe) | ![Products](https://github.com/user-attachments/assets/22247aee-f766-4493-9928-c20d214be1a6) | ![Details](https://github.com/user-attachments/assets/e23157e9-036e-4d27-9739-552fa8fca363) |

---

# Architecture

The project follows **MVVM + Repository Pattern + Dependency Injection**.

```
App
│
├── Views
│
├── ViewModels
│
├── Models
│
├── Repository
│   ├── Protocols
│   └── Implementations
│
├── Services
│
├── Network
│
├── Storage
│
├── Components
│
└── Utilities
```

### Layers

### View

Responsible only for displaying UI and forwarding user actions.

### ViewModel

- Holds UI state
- Calls Repository
- Handles loading & errors

### Repository

Acts as the single source of truth between the ViewModel and API layer.

### Service

Communicates with REST endpoints using `APIClient`.

### APIClient

Generic networking layer responsible for:

- HTTP Requests
- JSON Encoding
- JSON Decoding
- Error Handling
- Logging

---

# Technologies

- SwiftUI
- MVVM
- Repository Pattern
- Dependency Injection
- Async/Await
- URLSession
- Keychain
- Codable
- REST API

---

# Project Structure

```
CashAndCarry/

├── App
│   ├── App.swift
│   ├── AppRouter.swift
│   └── DIContainer.swift
│
├── Network
│   ├── APIClient.swift
│   ├── APIEndpoints.swift
│   ├── APIError.swift
│   └── AuthInterceptor.swift
│
├── Models
│
├── Repository
│   ├── Auth
│   ├── Product
│   ├── Event
│   └── Cart
│
├── Services
│
├── ViewModels
│
├── Views
│
├── Components
│
├── Storage
│   └── KeychainTokenStorage.swift
│
└── Resources
```

---

# Networking

The project uses a generic APIClient:

```swift
func request<T: Decodable>(
    endpoint: String,
    method: String,
    body: Encodable?
) async throws -> T
```

Features:

- Generic Decoding
- Generic Encoding
- Request Logging
- Response Logging
- Error Mapping
- Authorization Interceptor

---

# Authentication

Authentication uses JWT Bearer Token.

Flow:

```
Login

↓

Receive Access Token

↓

Save Token in Keychain

↓

Attach Token Automatically

↓

Authenticated Requests
```

---

# Security

Access tokens are securely stored in the **iOS Keychain** instead of UserDefaults.

```
KeychainTokenStorage
```

This ensures:

- Secure storage
- Persistent login
- Better protection against unauthorized access

---

# API Features

Implemented endpoints:

- Login
- Register
- Forgot Password
- Reset Password
- Logout (Local Token Removal)
- Fetch Products
- Fetch Events

---

# Loading States

The application provides a better user experience through skeleton loading animations.

Implemented for:

- Product Cards
- Event Cards

---

# Error Handling

All API errors are handled centrally.

Examples:

- Invalid credentials
- Validation errors
- Server errors
- Network failures

---

# Requirements

- Xcode 16+
- iOS 17+
- Swift 6

---

# Installation

Clone the repository.

```bash
git clone https://github.com/yourusername/cash-carry-ios.git
```

Open the project.

```bash
open CashAndCarry.xcodeproj
```

Run the project using Xcode.

---

# Future Improvements

- Product Search
- Category API Integration
- Favorites
- Pagination
- Pull to Refresh
- Image Caching
- Offline Support
- Push Notifications
- Profile Editing
- Order History
- Checkout Flow

---

# Author

**Edilayehu Tadesse**

Mobile Application Developer

- Flutter
- SwiftUI
- Kotlin
- React Native

GitHub:
https://github.com/yourusername

---

# License

This project is intended for educational and portfolio purposes.
