part of '../songs_screen.dart';

class SongViewer extends StatefulWidget {
  final SongExt song;
  final List<Book> books;
  final List<SongExt> songs;
  const SongViewer({
    super.key,
    required this.song,
    required this.books,
    required this.songs,
  });

  @override
  State<SongViewer> createState() => SongViewerState();
}

class SongViewerState extends State<SongViewer> {
  late SongExt song;
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    song = widget.song;
    bloc = context.read<HomeBloc>();
  }

  void presentSong() async {
    Book book = widget.books[0];
    try {
      book = widget.books.firstWhere(
        (b) => b.bookId == widget.song.book,
      );
    } catch (e) {
      logger('Failed to get the book: $e');
    }

    bool? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PresentorScreen(
          song: widget.song,
          book: book,
          songs: widget.songs,
        ),
      ),
    );

    if (result == true) {
      bloc.add(FilterData(book));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> verses = song.content.split("##");
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.copy),
            ),
          ),
          InkWell(
            onTap: presentSong,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(song.liked ? Icons.favorite : Icons.favorite_border),
            ),
          ),
          InkWell(
            onTap: presentSong,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(AppAssets.iconProject, height: 30, width: 30),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: verses.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              verses[index].replaceAll("#", "\n"),
              style: TextStyle(fontSize: size.height * 0.03),
            ).padding(all: 10),
          );
        },
      ),
    );
  }
}
