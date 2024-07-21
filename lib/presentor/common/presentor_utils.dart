import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../common/utils/app_util.dart';
import '../../common/utils/constants/app_constants.dart';
import '../../common/utils/logger.dart';
import '../../common/widgets/general/toast.dart';
import '../../common/widgets/presentor/presentor.dart';
import '../../data/models/songext.dart';
import '../bloc/presentor_bloc.dart';
import '../models/presentor_model.dart';

Future<PresentorModel> loadSong(SongExt song) async {
  PresentorModel? presentor;
  try {
    var hasChorus = false;
    List<Tab> widgetTabs = [];
    List<Widget> widgetContent = [];
    var verseInfos = [], verseTexts = [];

    var songBook = refineTitle(song.songbook);
    var songTitle = songItemTitle(song.songNo, song.title);

    var songVerses = song.content.split("##");
    final int verseCount = songVerses.length;

    if (song.content.contains("CHORUS")) {
      hasChorus = true;
    }

    if (hasChorus) {
      final String chorus = songVerses[1].toString().replaceAll("CHORUS#", "");

      verseInfos.add("1");
      verseInfos.add("C");
      verseTexts.add(songVerses[0]);
      verseTexts.add(chorus);

      for (int i = 2; i < verseCount; i++) {
        verseInfos.add(i.toString());
        verseInfos.add("C");
        verseTexts.add(songVerses[i]);
        verseTexts.add(chorus);
      }
    } else {
      for (int i = 0; i < verseCount; i++) {
        verseInfos.add((i + 1).toString());
        verseTexts.add(songVerses[i]);
      }
    }

    // Generate presentor slides
    for (final verse in verseInfos) {
      widgetTabs.add(
        Tab(
          child: PresentorInfo(
            info: verse,
            fontSize: 0.5 * .75,
          ),
        ),
      );
    }
    for (final verse in verseTexts) {
      widgetContent.add(PresentorText(
        lyrics: verse,
        /*onDoubleTap: () => Share.share(
          '${verse.replaceAll("#", "\n")}\n\n${songTitle},\n${songBook}',
          subject: l10n.shareVerse,
        ),*/
        //onLongPress: () => copyVerse(verse),
      ));
    }
    presentor = PresentorModel(
      hasChorus: hasChorus,
      songBook: songBook,
      songTitle: songTitle,
      songVerses: songVerses,
      widgetTabs: widgetTabs,
      widgetContent: widgetContent,
    );
  } catch (e) {
    //
  }
  return presentor!;
}

String getSongContent(SongExt song) {
  var songBook = refineTitle(song.songbook);
  var songTitle = songItemTitle(song.songNo, song.title);
  var songContent = song.content.replaceAll("#", "\n");
  return '$songTitle - $songBook\n\n$songContent';
}

Future<void> shareSong(SongExt song) async {
  try {
    Share.share(
      getSongContent(song) + AppConstants.fromApp,
      subject: 'Share the song: ${song.title}',
    );
  } catch (e) {
    logger('Error during sharing song: $e');
  }
}

Future<void> copySong(SongExt song) async {
  try {
    await Clipboard.setData(ClipboardData(
      text: getSongContent(song) + AppConstants.fromApp,
    ));
    showToast(
      text: '${song.title} copied!',
      state: ToastStates.success,
    );
  } catch (e) {
    logger('Error during copying song: $e');
  }
}

Future<void> copyVerse(PresentorState state, String lyrics) async {
  try {
    await Clipboard.setData(
      ClipboardData(
        text:
            '${lyrics.replaceAll("#", "\n")}\n\n${state.songTitle},\n${state.songBook}',
      ),
    );
    showToast(
      text: 'Verse copied',
      state: ToastStates.success,
    );
  } catch (e) {
    logger('Error during copying verse: $e');
  }
}
