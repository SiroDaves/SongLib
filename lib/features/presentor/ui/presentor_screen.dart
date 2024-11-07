import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/widgets/action/fab_widget.dart';
import '../../../common/widgets/presentor/presentor_animate.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/data/models/songext.dart';
import '../../../core/di/injectable.dart';
import '../../../core/theme/theme_colors.dart';
import '../bloc/presentor_bloc.dart';
import '../common/presentor_utils.dart';

part 'presentor_body.dart';
part 'presentor_details.dart';
part 'presentor_mobile.dart';
part 'widgets/fab_widget.dart';

class PresentorScreen extends StatefulWidget {
  final SongExt song;
  const PresentorScreen({super.key, required this.song});

  @override
  State<PresentorScreen> createState() => PresentorScreenState();
}

class PresentorScreenState extends State<PresentorScreen> {
  late PresentorBloc _bloc;
  bool isTabletOrIpad = false;
  late AppLocalizations tr;
  late SongExt song;

  bool isLiked = false, hasChorus = false, shownPcHints = false;
  bool slideHorizontal = false;
  int curStanza = 0, curSong = 0, curSlide = 0;
  List<String> songVerses = [], verseInfos = [], verseTexts = [];

  String songTitle = '', songBook='';
  double fSize = 25;
  List<Tab> widgetTabs = [];
  List<Widget> widgetContent = [];

  IconData likeIcon = Icons.favorite_border;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<PresentorBloc>();
    _bloc.add(PresentorSaveHistory(widget.song));
    _bloc.add(PresentorLoadSong(widget.song));
  }

  @override
  Widget build(BuildContext context) {
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;
    song = widget.song;

    return PresentorBody(parent: this);
  }
}
