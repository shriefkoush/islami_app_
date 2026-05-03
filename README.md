# ☪️ Islami App

A Flutter-based Islamic application that provides Muslims with essential daily tools including Quran reading, Hadith, Tasbeeh, Prayer Times, and Radio — all in one beautiful app.

---

## 📸 Screenshots

<p float="left">
  <img src="Home%20Screen.png" width="180"/>
  <img src="Soura%20Details%20Screen.png" width="180"/>
  <img src="Hadeth%20Screen.png" width="180"/>
  <img src="Sebha%20Screen.png" width="180"/>
  <img src="Radio%20Screen.png" width="180"/>
  <img src="Time%20Screen.png" width="180"/>
</p>

---

## ✨ Features

- 📖 Quran — Browse all Suras with verse count, search by name, and track recently read Suras
- 📜 Hadith — Read Hadiths with beautiful Islamic UI
- 📿 Tasbeeh (Sebha) — Digital prayer beads counter
- 🕌 Prayer Times — Real-time prayer schedule with next prayer countdown
- 📻 Radio — Stream Islamic radio stations and Quran reciters
- 🌙 Beautiful Islamic dark theme with gold accents

---

## 🏗️ Tech Stack

| Layer | Technology |
|---|---|
| Language | Dart |
| Framework | Flutter |
| State Management | Provider |
| Architecture | MVVM |
| API | Prayer Times API & Radio API |
| Storage | Shared Preferences |

---

## 🗂️ Project Structure

```
lib/
├── core/           # Shared utilities, constants, theme
├── features/
│   ├── quran/      # Quran screen & Sura details
│   ├── hadith/     # Hadith screen
│   ├── tasbeeh/    # Tasbeeh / Sebha screen
│   ├── radio/      # Radio & Reciters screen
│   └── time/       # Prayer times screen
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0

### Installation

```bash
# Clone the repo
git clone https://github.com/shriefkoush/islami_app_.git

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 📦 Dependencies

```yaml
provider: ^6.x
http: ^1.x
shared_preferences: ^2.x
```

---

## 👨‍💻 Author

**Shrief Hassan** — Flutter Developer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Shrief%20Hassan-blue?logo=linkedin)](https://www.linkedin.com/in/shrief-hassan-95884a22a)
[![GitHub](https://img.shields.io/badge/GitHub-shriefkoush-black?logo=github)](https://github.com/shriefkoush)
