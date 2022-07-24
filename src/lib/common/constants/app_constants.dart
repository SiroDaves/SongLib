class AppConstants {
  static const appTitle = "SongLib";
  static const listTitle = "Song Lists";
  static const draftTitle = "Song Drafts";
  static const booksTitle = "Select Song Books";
  static const booksTitleLoading = "Loading data ...";

  static const appIconPath = "assets/app_icon.png";

  static const homeTitle = "Home";
  static const todoTitle = "To Do";

  static const hasChorus = "Has Chorus";
  static const noChorus = "No Chorus";
  static const verses = " verse";

  static const okay = "OKAY";
  static const cancel = "CANCEL";
  static const proceed = "PROCEED";
  static const justAMinute = "Just a minute!";
  static const doneSelecting = "Done with selecting?";
  static const doneSelectingBody =
      "If you are done selecting please proceed ahead. We can always bring you back to reselect.";
  static const noSelection = "Oops! No selection found";
  static const noSelectionBody =
      "Please select at least 1 book to proceed to the next step.";
  static const errorOccurred = "Ooops! You weren't supposed to see this!";
  static const errorOccurredBody =
      "An unexpected error occurred while trying to fetch data from the server. Please try again later or contact support";
  static const noConnectionBody =
      "If you have reliable internet connection, then our servers are down. It's one thing or the other, we can't tell which is which.";
}

class PrefKeys {
  static const selectedBooks = "selected_books";
  static const dataLoaded = "data_loaded";
  // Preferences.setBooksLoaded(true);
}
