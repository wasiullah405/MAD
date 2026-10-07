<h1 align="center">📱 Flutter Portfolio App</h1>

<p align="center">
  A clean and modern mobile portfolio app built with Flutter, featuring a login screen and a personal profile page.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-2A9D8F?style=for-the-badge" alt="Platform" />
  <img src="https://img.shields.io/badge/Status-Completed-1E3A5F?style=for-the-badge" alt="Status" />
</p>

---

## 📖 About the Project

**Flutter Portfolio App** is a mini project developed to practice the core concepts of Flutter and Dart. The app works as a digital portfolio: a user signs in through a login screen and is taken to a profile page that presents personal details, education and an introduction.

The project focuses on clean UI design, reusable code and a simple, easy-to-customize structure. The whole app lives in a single file, and all personal data is kept at the top of it so it can be changed in seconds.

---

## ✨ Features

- 🔐 **Login screen** with email and password fields and input validation
- 👤 **Profile page** with photo, name and professional title
- 🎓 **Personal information** section (email, university, program, semester, city, age)
- 📝 **About Me** section
- 📞 **Contact button** that shows the phone number in a dialog
- 🖼️ **Image fallback:** if the photo is missing, a default icon is shown instead of crashing
- 🎨 **Custom color theme** (Navy Blue and Teal)
- ♻️ **Reusable widgets** for the photo, buttons, headings and text fields

---

## 📸 Screenshots

| Login Page | Portfolio Page |
|:---:|:---:|
| ![Login](screenshots/login.png) | ![Profile](screenshots/profile.png) |

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| **Flutter** | UI framework |
| **Dart** | Programming language |
| **Material Design** | Widgets and styling |

---

## 🧠 Concepts Practiced

- Stateless widgets and widget composition
- Reusable helper functions
- Navigation between screens using `Navigator.push`
- `TextField` with `TextEditingController`
- `AlertDialog` and `SnackBar`
- Layouts with `Column`, `Row`, `Padding` and `SingleChildScrollView`
- Loading local images with `Image.asset` and `errorBuilder`
- Asset management in `pubspec.yaml`

---

## 📂 Project Structure

```
my_portfolio/
├── lib/
│   └── main.dart          # Login page + Portfolio page
├── assets/
│   └── images/
│       └── my_pic.png     # Profile photo
├── screenshots/           # App screenshots for README
├── pubspec.yaml           # Dependencies and assets
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- Android Studio or VS Code
- An emulator or a physical device

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git

# 2. Go to the project folder
cd YOUR_REPO

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
```

---

## ⚙️ Customization

Open `lib/main.dart` and edit the values at the top of the file:

```dart
const myName = 'Your Name';
const myTitle = 'Software Engineer';
const myEmail = 'yourname@example.com';
const myUniversity = 'Your University';
const myPhone = '03XXXXXXXXX';
const myPhoto = 'assets/images/my_pic.png';
```

To change the colors, edit `primary`, `accent` and `bg`.

---

## 🔮 Future Improvements

- Real authentication with Firebase
- Sign-up page
- Projects and skills sections
- Dark mode
- Clickable links for email, phone and social media

---

## 👨‍💻 Author

**YOUR_NAME**
Software Engineering Student, Riphah International University

- GitHub: [@YOUR_USERNAME](https://github.com/YOUR_USERNAME)

---

<p align="center">⭐ If you like this project, give it a star!</p>
