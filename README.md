Here's the updated `README.md` to highlight the bonus features:

---

# KineticQR

KineticQR is a Flutter application that allows users to scan and generate QR codes. It features a clean and intuitive interface with theme toggling for light and dark modes, animations, and security enhancements.

## Features

- **Scan QR Code**: Use the device camera to scan QR codes and display their content.
- **Generate QR Code**: Input text to generate a QR code that can be shared or saved.
- **Dark Mode Support**: Switch between light and dark themes for a customizable user experience.
- **Animations**: Enhanced user experience with smooth animations during scanning and QR code generation.
- **Security Notifications**: Alerts users if a scanned QR code leads to a potentially harmful website.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/khush1yaaar/kineticQR.git
   cd kineticqr
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Configure Android permissions:
   - Ensure that `CAMERA` and `FLASHLIGHT` permissions are set in `AndroidManifest.xml`.

4. Run the app:

   ```bash
   flutter run
   ```

## Code Structure

- **`main.dart`**: Entry point of the application.
- **`lib/screens/`**: Contains the main screens of the app:
  - **`scan_qr_code.dart`**: Screen for scanning QR codes with security notifications.
  - **`generate_qr_code.dart`**: Screen for generating QR codes with animations.
  - **`generated_qr.dart`**: Screen displaying the generated QR code.
- **`lib/theme/`**: Contains theme-related files for managing light and dark modes.
- **`pubspec.yaml`**: Manages dependencies and project metadata.

## Code Comments

- **`scan_qr_code.dart`**: Contains logic for scanning QR codes, handling detected barcodes, and notifying users of potentially harmful websites.
- **`generate_qr_code.dart`**: Handles text input, generates QR codes, and includes animations for improved user experience.
- **`generated_qr.dart`**: Displays the generated QR code with styling and alignment.

## Contributions

Feel free to submit issues or pull requests. For detailed contribution guidelines, please refer to the project's CONTRIBUTING.md file.

## License

This project is licensed under the MIT License.

---

This README now highlights the bonus features and should make your project stand out even more!