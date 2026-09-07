# Betopia AI 🤖

**A production-ready Conversational AI Assistant application built with Flutter and Clean Architecture.**

Betopia AI is a modern, high-performance mobile application designed to deliver an intelligent, seamless conversational AI experience. Built on top of **Clean Architecture** principles, it leverages **Riverpod** for robust state management, **GoRouter** for declarative navigation, and a structured network layer designed for LLM APIs (OpenAI, Gemini, Claude, or custom backend endpoints).

---

## 🌟 Key Features

### 💬 Intelligent Conversational Interface
- **Real-time AI Chat**: Smooth multi-turn chat experience with user & assistant message bubbles.
- **Rich Markdown & Code Rendering**: Formatted text, tables, bullet points, and syntax-highlighted code blocks with quick-copy buttons.
- **Chat History & Session Management**: Organize chats by conversations, start new chats, rename topics, and delete old sessions.
- **Smart Prompt Starters**: Quick suggested prompts and inspiration topics for fast interactions.
- **Dynamic Typing Indicators**: Animated feedback during AI response generation.

### 🔐 Authentication & User Management
- **Full Auth Flow**: Login, registration, password reset, and logout workflows.
- **Session Persistence**: Secure token management with `flutter_secure_storage` and "Remember Me" capabilities.
- **Profile & Settings**: User preferences, theme toggle, and account details.

### 🎨 Premium UI & Theming
- **Modern AI-Powered Design**: Clean, minimal, distraction-free conversational UI.
- **Adaptive Dark & Light Modes**: Comprehensive theme system with semantic tokens and custom extensions.
- **Multi-Language Localization**: Built-in internationalization (English, Bangla, Arabic) with runtime switching.

### 🏗 Enterprise-Grade Architecture
- **Clean Architecture**: Decoupled layers (`core`, `domain`, `data`, `presentation`) for testability and scalability.
- **Riverpod 3 + Codegen**: Predictable, type-safe reactive state management with auto-dispose and dependency injection.
- **Resilient Network Layer**: Dio + Retrofit with interceptors, token refresh, and custom error classifiers.

---

## 📸 Badges

![Flutter](https://img.shields.io/badge/Flutter->=3.38.4-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart->=3.12.0-0175C2?logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/State_Management-Riverpod_3-blue)
![Architecture](https://img.shields.io/badge/Architecture-Clean_Architecture-brightgreen)
![License](https://img.shields.io/badge/License-MIT-green.svg)

---

## 🛠 Technology Stack

### Core Framework & State Management
| Technology | Package | Purpose |
|------------|---------|---------|
| **Flutter** | `sdk: flutter` | Cross-platform UI toolkit |
| **Dart** | `>=3.12.0` | Modern, null-safe programming language |
| **Flutter Riverpod** | `^3.3.2` | Reactive state management & dependency injection |
| **Riverpod Annotation** | `^4.0.3` | Code generation for type-safe providers |
| **GoRouter** | `^17.4.0` | Declarative routing, deep-linking, & route guards |

### Networking & Data Persistence
| Technology | Package | Purpose |
|------------|---------|---------|
| **Dio** | `^5.11.0` | Powerful HTTP networking client with interceptors |
| **Retrofit** | `^4.9.2` | Type-safe REST client generator |
| **Flutter Secure Storage** | `^11.0.0` | Encrypted local storage for auth tokens & API keys |
| **SharedPreferences** | `^2.5.5` | Key-value storage for app settings and preferences |
| **Dart Mappable** / **Freezed** | `^4.8.0` / `^3.1.0` | Immutable data modeling & JSON serialization |

### UI & Utilities
| Technology | Package | Purpose |
|------------|---------|---------|
| **Gap** | `^3.0.1` | Clean, readable widget spacing |
| **Flutter SVG** | `^2.3.0` | Vector asset rendering |
| **Logger** / **Pretty Dio Logger** | `^2.7.0` / `^1.4.0` | Structured runtime and network logging |
| **Intl** | `^0.20.2` | Date formatting and multi-language localization |

---

## 🏛 Architecture Overview

Betopia AI follows the **Clean Architecture** pattern to guarantee maintainability, testability, and independence from external frameworks:

```
lib/src/
├── core/                   # Shared utilities, base classes, themes, DI & localization
│   ├── base/               # Base view models, use cases, and contracts
│   ├── di/                 # Riverpod dependency injection definitions
│   ├── extensions/         # Context, string, and theme extensions
│   ├── localization/       # l10n configuration & translations (en, bn, ar)
│   └── logger/             # App logging setup
│
├── domain/                 # Pure business logic (framework independent)
│   ├── entities/           # Core models (User, ChatSession, Message, Prompt)
│   ├── repositories/       # Abstract repository interfaces
│   └── use_cases/          # Business logic use cases (SendMessage, GetChatHistory, etc.)
│
├── data/                   # Data implementation & external communications
│   ├── models/             # DTOs with JSON serialization (dart_mappable / freezed)
│   ├── repositories/       # Concrete repository implementations
│   └── services/           # Network REST client (Retrofit), LLM services & local storage
│
└── presentation/           # UI Layer (widgets, screens, controllers)
    ├── core/               # App-wide widgets, design system & router
    │   ├── router/         # GoRouter configuration & route guards
    │   ├── theme/          # Color schemes, typography, and theme extensions
    │   └── widgets/        # Shared buttons, inputs, loaders, dialogs
    └── features/           # Feature-driven UI modules
        ├── authentication/ # Sign In, Sign Up, Forgot Password
        ├── home/           # Chat list, new chat, and assistant selection
        ├── onboarding/     # Intro screens & model walkthrough
        ├── profile/        # User settings, theme toggle, API keys
        └── splash/         # App boot & auth gate checks
```

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: `>= 3.38.4`
- **Dart SDK**: `>= 3.12.0`
- **IDE**: Android Studio / VS Code with Flutter & Dart extensions
- **AI Backend / API Key**: OpenAI API Key, Google Gemini API Key, or your custom LLM backend endpoint.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/betopia_ai.git
   cd betopia_ai
   ```

2. **Install Flutter dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run Code Generation**:
   Generate Riverpod providers, serialization models, and asset bindings:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Launch the application**:
   ```bash
   flutter run
   ```

---

## ⚙️ AI Configuration & LLM Integration

Betopia AI is designed to connect easily with major AI providers:

### Connecting to OpenAI / LLM APIs
Set your base URL and API keys in your environment configuration or securely in app settings:

```dart
// Example: Chat Completion Request
final request = ChatCompletionRequest(
  model: 'gpt-4o-mini', // or 'gpt-4o' / 'gpt-3.5-turbo'
  messages: [
    ChatMessage(role: 'system', content: 'You are Betopia AI, a helpful AI assistant.'),
    ChatMessage(role: 'user', content: userPrompt),
  ],
  temperature: 0.7,
);
```

### Continuous Code Generation (Watch Mode)
When developing or adding new providers and models, keep the generator running:
```bash
dart run build_runner watch --delete-conflicting-outputs
```

---

## 🧪 Testing

The repository contains automated unit and integration tests mirroring the `lib/src` structure:

```bash
# Run all unit and widget tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test suite
flutter test test/data/services/network/auth/token_manager_test.dart
```

---

## 🗺 Roadmap

- [x] Clean Architecture setup with Riverpod 3 & Codegen
- [x] Complete Authentication flow & Secure Token Storage
- [x] Interactive Chat UI with message history
- [ ] Real-time SSE / WebSocket streaming for word-by-word AI generation
- [ ] Voice input & Speech-to-Text (STT) integration
- [ ] Image understanding / Vision model input (Multimodal AI)
- [ ] Export chat history (PDF, Markdown, JSON)
- [ ] Offline local model execution with on-device LLMs

---

## 🤝 Contributing

Contributions make the open-source community an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'feat: Add AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

---

<p align="center">
  Built with ❤️ for AI developers by the Betopia Team.
</p>
