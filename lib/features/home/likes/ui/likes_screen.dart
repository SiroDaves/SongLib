import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/data/models/songext.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../common/widgets/progress/general_progress.dart';
import '../../../presentor/ui/presentor_screen.dart';
import '../../common/bloc/home_bloc.dart';

class LikesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is FilteredState && state.likes.isNotEmpty) {
          return ListView.builder(
            itemCount: state.likes.length,
            itemBuilder: (context, index) {
              final SongExt like = state.likes[index];
              return SearchSongItem(
                song: like,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PresentorScreen(song: like),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return EmptyState(title: 'You have not liked a song yet.',);
        }
      },
    );
  }
}