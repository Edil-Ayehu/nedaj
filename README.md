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