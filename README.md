# 🎬 Flutter Movies App

A cross-platform mobile application built with Flutter that fetches and displays trending and now playing movies using the [TMDB API](https://developers.themoviedb.org/3). Users can view movie details, search movies with debounce, bookmark favorites, and even access content offline.

---

## 🚀 Features

- 🔥 Trending Movies & Now Playing Movies (from TMDB)
- 🔍 Search with live suggestions
- ❤️ Bookmark/Favorite your movies (stored locally)
- 📃 Movie Details page with poster, rating, and description
- 📶 Offline Mode – Caches API results using Hive
- 🎨 Responsive and clean UI
- 📱 Android & iOS support

---

## 🛠️ Tech Stack

- **Flutter** (Latest stable)
- **Dart**
- **TMDB API** for movie data
- **Bloc** for state management
- **Retrofit + Dio** for networking
- **Hive** for local database and offline storage
- **AutoRoute** for navigation
- **Freezed** for model generation
- **MVVM + Repository Pattern**

---

## 📦 Installation

```bash
#1. Clone the repo
git clone https://github.com/pranavkumar14/movie_app.git
cd movie_app
# movie_app

#2. Install Dependencies
 flutter pub get

#3. Add .env File
Create a file named .env in the root directory:

.env
TMDB_BEARER_TOKEN=your_tmdb_api_key_here

#4. Generate Required Files

flutter pub run build_runner build --delete-conflicting-outputs

#5. Run the App
 
 flutter run

