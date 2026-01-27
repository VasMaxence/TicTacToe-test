# ia.md — Repository Context (AI-only)

This file defines the **technical context and constraints** of the repository.
It is intended to be used as **persistent context for AI agents** (Claude, Gemini, Opus, etc.)
when answering future requests about this codebase.

Do NOT treat this file as user-facing documentation.

---

## 1. Repository Purpose

This repository is a Flutter technical test.
The primary focus is:

- architecture
- separation of concerns
- testability
- scalability

Any change or suggestion should prioritize **code structure and maintainability** over feature completeness.

---

## 2. Architectural Rules

The project follows a **feature-first Clean Architecture**.

### Layer responsibilities

- `domain/`
  - pure Dart
  - no Flutter imports
  - no Hive or infrastructure dependencies
  - contains entities, use cases, repository interfaces

- `data/`
  - infrastructure implementations
  - Hive models, datasources, repository implementations
  - mapping between domain and persistence models

- `presentation/`
  - controllers (StateNotifier)
  - UI widgets
  - orchestration of domain use cases
  - side effects handled here, not in domain

Side effects (persistence, IO) must:

- be triggered by **state transitions**
- never be triggered directly from UI widgets

---

## 3. State Management

- Riverpod is used for dependency injection and state management
- Controllers depend on:
  - domain use cases
  - abstract repositories
- Infrastructure is injected via providers
- Providers may be synchronous or asynchronous

A synchronous provider must NOT depend on an asynchronous provider.

---

## 4. Persistence Rules (Hive)

- Hive is treated strictly as infrastructure
- Hive must NOT appear in:
  - domain layer
  - controller logic
- Boxes are:
  - feature-owned
  - opened lazily via `FutureProvider`
- No box is eagerly opened in `main.dart`

Hive initialization occurs only in:

- application bootstrap (`main.dart`)
- data layer tests (using `hive_test`)

---

## 5. Application Bootstrap

- `main.dart` is responsible only for:
  - framework initialization
  - environment configuration
  - Hive initialization
  - provider overrides

`main.dart` must NOT:

- open feature-specific boxes
- contain business logic

---

## 6. Testing Rules

Tests are layered and isolated.

### Domain tests

- no Flutter
- no Hive
- pure logic only

### Data layer tests

- Hive initialized using `hive_test`
- temporary in-memory storage
- no UI or controller logic

### Controller tests

- use cases are mocked
- no Hive initialization
- no provider container required unless explicitly tested

Tests should validate **behavior**, not implementation details.

---

## 7. How to Run

Install dependencies:

```bash
flutter pub get

# To run the app with flavors :
flutter run --flavor dev     -t lib/main_dev.dart
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor prod    -t lib/main_prod.dart

# To run the tests :
flutter test
```

---

## 8. Code Modification Guidelines for AI Agents

When generating or modifying code:
• respect existing architecture
• do not introduce shortcuts (services, globals, static state)
• keep domain pure
• prefer explicit dependency injection
• avoid adding features unless explicitly requested

If unsure:
• ask for clarification rather than assuming intent

---
