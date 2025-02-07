part of '../songs_screen.dart';

class SongViewer extends StatefulWidget {
  final SongExt song;
  const SongViewer({super.key, required this.song});

  @override
  State<SongViewer> createState() => SongViewerState();
}

class SongViewerState extends State<SongViewer> {
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    List<String> verses = widget.song.content.split("##");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${songItemTitle(widget.song.songNo, widget.song.title)} - ${refineTitle(widget.song.songbook)}',
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.copy),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(widget.song.liked
                  ? Icons.favorite
                  : Icons.favorite_border),
            ),
          ),
          InkWell(
            onTap: () {},
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
              style: TextStyle(fontSize: 16),
            ).padding(all: 10),
          );
        },
      ),
    );
  }
}
