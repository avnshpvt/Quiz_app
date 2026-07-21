# Quiz Application (Flutter Web)

A premium, production-level **Quiz Application** built using **Flutter Web**. Designed with pixel-perfect fidelity to match the target reference UI, complete with local progress persistence via `SharedPreferences`, answer locking, visual correctness indicators, step-by-step explanations, an interactive question selector grid, and responsive design across all viewports.

---

## 🌟 Key Features

- **Pixel-Accurate UI Design**:
  - Electric Blue outer page canvas (`#3577FF`).
  - Rounded top header banner with bold title (`Quiz Application UI`).
  - White container with centered `Quiz Title` and blue outline question prompt card.
- **Answer Selection & Locking**:
  - Once an answer option is clicked, the selection is **permanently locked** and cannot be changed.
  - **Correct Option**: Highlighted in **light green** (`#ECFDF5` background, `#10B981` border & text, checkmark icon).
  - **Incorrect Selection**: Highlighted in **light red** (`#FEF2F2` background, `#EF4444` border & text, cross icon) while also revealing the correct green choice.
- **Explanations**:
  - Automatically displays step-by-step mathematical and logical solutions post-selection.
- **Question Selector Grid (Right Sidebar)**:
  - Header showing progress (`Question X/20`) and an interactive `Need Help ?` modal dialog.
  - 20-Badge Circular Grid:
    - 🌸 **Pink Circle (`#FF8A8A`)**: Active / Current question.
    - 🔷 **Blue Circle (`#93C5FD`)**: Answered question.
    - ⬜ **Gray Circle (`#CBD5E1`)**: Unanswered question.
  - Direct jump navigation on badge tap.
- **Local Persistence (`SharedPreferences`)**:
  - Automatically saves user choices and active question index.
  - Progress persists seamlessly across browser reloads.
  - Includes a **Reset Progress** option inside the `Need Help ?` dialog.
- **100% Fully Responsive Layout**:
  - Adapts between desktop side-by-side view (>760px) and mobile/tablet stacked view (≤760px) with zero pixel overflow.

---

## 🏗️ Project Architecture

Built following a clean, modular production architecture:

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart       # App color palette, gradients & drop shadows
│   │   └── app_styles.dart       # Typography & text styles (Google Fonts Inter)
│   └── services/
│       └── quiz_storage_service.dart # SharedPreferences storage helper
├── models/
│   └── question_model.dart       # Question data model & 20-question dataset
├── providers/
│   └── quiz_provider.dart        # State management (Navigation, Locking, Persistence)
├── views/
│   ├── widgets/
│   │   ├── header_banner.dart    # Top pill header widget
│   │   ├── question_card.dart    # Blue-outlined question card
│   │   ├── option_card.dart      # Interactive option card with status feedback
│   │   ├── nav_buttons.dart      # Prev / Next action buttons
│   │   ├── explanation_card.dart # Solution explanation box
│   │   ├── question_selector.dart# Right sidebar circular 1..20 badge grid
│   │   └── help_dialog.dart      # Instructions & Reset modal
│   └── quiz_screen.dart          # Main responsive layout container
└── main.dart                     # App entry point with Provider & SharedPreferences init
```

---

## 🚀 Setup & Installation Instructions

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`v3.12.0` or higher)
- Chrome or Edge Browser
- Git

### Step-by-Step Local Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/flutter_mechine_test.git
   cd flutter_mechine_test
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run Code Analysis**:
   ```bash
   flutter analyze
   ```

4. **Run the Application locally**:
   ```bash
   flutter run -d chrome
   ```
   *Alternatively, run on web-server:*
   ```bash
   flutter run -d web-server --web-port=8080
   ```

---

## 📦 Building for Production

To create an optimized production release web bundle:

```bash
flutter build web --release
```

The output files will be generated in `build/web/`.

---

## 🔥 Firebase Hosting Deployment

To deploy the application to Firebase Hosting:

1. **Install Firebase CLI & FlutterFire**:
   ```bash
   npm install -g firebase-tools
   dart pub global activate flutterfire_cli
   ```

2. **Configure Firebase Project**:
   ```bash
   flutterfire configure
   ```

3. **Initialize Firebase Hosting**:
   ```bash
   firebase init hosting
   ```
   - Select your Firebase Project.
   - Set public directory: `build/web`
   - Configure as single-page app: `Yes`

4. **Build and Deploy**:
   ```bash
   flutter build web --release
   firebase deploy --only hosting
   ```

---

## 🛠️ Technology Stack

- **Framework**: [Flutter Web](https://flutter.dev/multi-platform/web)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Local Storage**: [SharedPreferences](https://pub.dev/packages/shared_preferences)
- **Typography**: [Google Fonts (Inter)](https://pub.dev/packages/google_fonts)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
