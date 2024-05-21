import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/models/book.dart';
import '../../data/models/songext.dart';
import '../bloc/presentor_bloc.dart';

part 'presentor_body.dart';

class PresentorScreen extends StatefulWidget {
  final SongExt song;
  final List<Book> books;
  final List<SongExt> songs;
  const PresentorScreen({
    super.key,
    required this.song,
    required this.books,
    required this.songs,
  });

  @override
  State<PresentorScreen> createState() => PresentorScreenState();
}

class PresentorScreenState extends State<PresentorScreen> {
  bool isTabletOrIpad = false;
  late AppLocalizations tr;

  late SongExt song;
  late List<Book> books;
  late List<SongExt> songs;

  @override
  Widget build(BuildContext context) {
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;
    
    song = widget.song;
    books = widget.books;
    songs = widget.songs;

    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return PresentorBloc();
        },
        child: PresentorScreenBody(parent: this),
      ),
    );
  }
}
