class AppConstants {
  static const appTitle = "SongLib";
  static const loginTitle = "Login";
  static const booksTitle = "Select Song Books";
  static const homeTitle = "Home";
  static const todoTitle = "To Do";

  static const hasChorus = "Has Chorus";
  static const noChorus = "No Chorus";
  static const verses = " verse";

  static const okay = "OKAY";
  static const cancel = "CANCEL";
  static const proceed = "PROCEED";
  static const justAMinute = "Just a minute!";
  static const doneSelecting = "Are you done with selecting?";
  static const doneSelectingBody =
      "If you are done selecting please proceed ahead. We can always bring you back to reselect.";
  static const noSelection = "Oops! No selection found";
  static const noSelectionBody =
      "Please select at least 1 book to proceed to the next step.";
  static const noConnection = "Ooops! You weren't supposed to see this!";
  static const noConnectionBody =
      "If you have reliable internet connection, then our servers are down. It's one thing or the other, we can't tell which is which.";
}

class PrefKeys {
  static const selectedBooks = "selected_books";
  static const booksLoaded = "books_loaded";
  static const songsLoaded = "songs_loaded";
  // Preferences.setBooksLoaded(true);
}
