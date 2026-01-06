# 🗳️ Evoting_App (Frontend)

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/github/license/rabiulrahat/Evoting_App?style=for-the-badge)

A secure, cross-platform mobile and web application for the **Hybrid Blockchain-based E-Voting System (HBPEVS)**. This application serves as the voter interface, allowing users to securely cast votes, view candidates, and verify election results with the transparency and immutability of blockchain technology.

> **Note**: This repository contains the **Frontend** source code. The backend logic and blockchain integration are handled by [HBPEVS](https://github.com/JonyBepary/HBPEVS).

---

## 📱 Features

- **Secure Authentication**: User login and verification system (e.g., OTP/QR) to ensure only eligible voters participate [memory:1].
- **Candidate Dashboard**: View detailed profiles and manifestos of election candidates.
- **Blockchain-Verified Voting**: Cast votes that are cryptographically secured and immutably recorded on the blockchain via the HBPEVS backend.
- **Real-Time Results**: View live election status and final results directly within the app.
- **Cross-Platform Support**: Optimized for Android, iOS, and Web platforms using Flutter.

---

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Architecture**: MVVM / Clean Architecture (Recommended)
- **State Management**: Provider / Bloc (Check `pubspec.yaml` for specifics)
- **Backend Integration**: RESTful API / HTTP (Connects to [HBPEVS](https://github.com/JonyBepary/HBPEVS))

---

## 🚀 Getting Started

Follow these instructions to set up the project locally for development and testing.

### Prerequisites

- **Flutter SDK**: [Install Flutter](https://docs.flutter.dev/get-started/install) (Version 3.0.0 or higher recommended)
- **Dart SDK**: Included with Flutter.
- **Backend Server**: You must have the [HBPEVS Backend](https://github.com/JonyBepary/HBPEVS) running locally or hosted remotely.

### Installation

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/rabiulrahat/Evoting_App.git
    cd Evoting_App
    ```

2.  **Install Dependencies**
    ```bash
    flutter pub get
    ```

3.  **Configure Backend Connection**
    *   Navigate to `lib/core/constants/` or `lib/utils/` (depending on your folder structure).
    *   Update the `BASE_URL` to point to your running HBPEVS backend instance (e.g., `http://localhost:8000` or `http://192.168.x.x:8000` for physical devices).

4.  **Run the Application**
    *   **For Android/iOS (Emulator or Device):**
        ```bash
        flutter run
        ```
    *   **For Web:**
        ```bash
        flutter run -d chrome
        ```

---

## 📂 Project Structure

```bash
lib/
├── main.dart                # App entry point
├── routes/                  # Route definitions and navigation
├── services/                # API clients, HTTP handlers
├── models/                  # Data models (User, Candidate, Vote, Result)
├── screens/                 # UI screens
│   ├── auth/                # Login, registration
│   ├── voting/              # Candidate list, vote screen
│   └── results/             # Result / statistics views
└── widgets/                 # Reusable components

