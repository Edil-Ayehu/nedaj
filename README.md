# Nedaj - Mobile Fuel Payment Application

## Overview

Nedaj is a cutting-edge mobile application designed to revolutionize the way users pay for fuel at gas stations. This app allows users to seamlessly scan QR codes, generate their own QR codes for payments, and manage their fuel transactions with ease. Built with Flutter, Nedaj offers a smooth, intuitive user experience across both Android and iOS platforms.

## Key Features

1. **QR Code Scanning**: Users can quickly scan QR codes at gas stations to initiate payments.
2. **QR Code Generation**: The app allows users to generate their own QR codes for contactless payments.
3. **Multi-step Payment Process**: A user-friendly, step-by-step interface guides users through the payment process.
4. **Vehicle Management**: Users can select from their registered vehicles for each transaction.
5. **Fuel Type Selection**: Supports multiple fuel types including Petrol, Diesel, and Electric.
6. **Transaction History**: Keeps a record of all fuel payments for easy tracking.
7. **Secure Authentication**: Implements robust login and registration processes.

## Project Structure

The project follows a modular structure for easy maintenance and scalability:

- `lib/`
  - `auth/`: Authentication-related screens and logic
  - `main services/`: Core functionalities of the app
    - `pay by qr/`: QR code payment feature
  - `widgets/`: Reusable UI components
  - `export.dart`: Central export file for easy importing
  - `main.dart`: Entry point of the application

## Key Components

### Login Screen
dart:lib/auth/screens/login_screen.dart
startLine: 1
endLine: 101

This screen handles user authentication, providing a sleek interface for users to log in to their accounts.

### Pay By QR Screen
dart:lib/main services/pay by qr/screens/pay_by_qr.dart
startLine: 1
endLine: 329

The central hub for QR-based transactions, allowing users to scan QR codes and initiate the payment process.

### QR Scan Page
dart:lib/main services/pay by qr/screens/pay_by_qr_scan_page.dart
startLine: 1
endLine: 495

Handles the scanning process and guides users through the payment steps.

### QR Generation Page
dart:lib/main services/pay by qr/screens/pay_by_qr_generate_page.dart
startLine: 1
endLine: 440

Enables users to create their own QR codes for payments, offering a flexible payment option.

## Getting Started

To run this project locally:

1. Ensure you have Flutter installed on your machine.
2. Clone this repository: `git clone [https://github.com/Edil-Ayehu/nedaj]`
3. Navigate to the project directory: `cd nedaj`
4. Install dependencies: `flutter pub get`
5. Run the app: `flutter run`

## Dependencies

Key dependencies include:
- `get`: For state management and navigation
- `qr_code_scanner`: For QR code scanning functionality
- `qr_flutter`: For generating QR codes
- `permission_handler`: To manage device permissions
- `lottie`: For engaging animations

For a full list of dependencies, refer to the `pubspec.yaml` file.

## Contributing

We welcome contributions to Nedaj! If you'd like to contribute, please:

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/AmazingFeature`
3. Commit your changes: `git commit -m 'Add some AmazingFeature'`
4. Push to the branch: `git push origin feature/AmazingFeature`
5. Open a pull request

## License

This project is licensed under the [EagleLion System Technology PLC](https://www.eaglelionsystems.com/).

## Contact

For any queries or support, please contact [edilayehu534027@gmail.com].

---

Thank you for your interest in Nedaj! We hope this application provides a seamless and efficient fuel payment experience for users worldwide.