# TaskFlow 🚀

A simple and scalable Flutter Todo application built using **Bloc**, **Cubit**, and **Clean Architecture** principles.

## 📱 Features

### Authentication
- Splash Screen
- Login Screen
- Session Persistence using SharedPreferences
- Auto-login for authenticated users

### Task Management
- Add Tasks
- Edit Tasks
- Delete Tasks
- Mark Tasks as Completed
- Toggle Task Status
- Strike-through Completed Tasks

### State Management
- Cubit for Authentication & Splash Flow
- Bloc for Task Management
- Reactive UI Updates

## 🏗️ Architecture

```text
lib/
├── core/
│   ├── themes/
│   └── constants/
│
├── features/
│   ├── splash/
│   │   ├── presentation/
│   │   │   ├── cubit/
│   │   │   └── pages/
│   │
│   ├── auth/
│   │   ├── presentation/
│   │   │   ├── cubit/
│   │   │   └── pages/
│   │
│   └── task/
│       ├── data/
│       │   └── models/
│       │
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
```


## 👨‍💻 Author

**Jency Sebasthiyar**

GitHub:
https://github.com/Arockia-Jency

---

Built with Flutter ❤️
