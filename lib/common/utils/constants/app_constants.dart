import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../app_util.dart';
import '../logger.dart';

class AppConstants {
  AppConstants._();
  static String dbName = 'Songlib.db';
  static const String editsTable = 'edits';
  static const String draftsTable = 'drafts';
  static const String booksTable = 'books';
  static const String songsTable = 'songs';
  static const String listedsTable = 'listeds';
  static const String searchesTable = 'searches';
  static const String historiesTable = 'histories';

  static const String songExtSql =
      'SELECT s.rid, s.book, s.songId, s.songNo, s.title, s.alias, '
      's.content, s.views, s.likes, s.liked, b.title AS songbook '
      'FROM $songsTable AS s '
      'LEFT JOIN $booksTable AS b '
      'ON s.book=b.bookNo '
      'ORDER BY songNo ASC';

  static const String historyExtSql =
      'SELECT s.rid, s.book, s.songId, s.songNo, s.title, s.alias, '
      's.content, s.views, s.likes, s.liked, b.title AS songbook '
      'FROM $songsTable AS s '
      'LEFT JOIN $booksTable AS b ON s.book=b.bookNo '
      'ORDER BY songNo ASC';

  static const String listedExtSql =
      'SELECT l.parentid, l.id, l.position, l.id, l.created, l.updated, '
      'l.song, s.book, s.songNo, s.title, s.alias, s.content, s.views, '
      's.likes, s.liked, s.id AS songId, b.title AS songbook '
      'FROM $listedsTable AS l '
      'LEFT JOIN $songsTable AS s ON l.song=s.id '
      'LEFT JOIN $booksTable AS b ON s.book=b.bookNo '
      'ORDER BY l.updated DESC';

  static const String songsTableViews = 'viewsongs';
  static const String listedsTableViews = 'viewlisteds';
  static const String historiesTableViews = 'viewhistories';

  static const siteLink = "https://songlib.vercel.app/";
  static const applestoreLink = "https://apps.apple.com/app/id6446771305";
  static const playstoreLink =
      "https://play.google.com/store/apps/details?id=com.songlib";
  static const microsoftstoreLink =
      "https://www.microsoft.com/store/apps/9PG6L35QR5FS";
  static const tshirtOrderLink =
      "https://docs.google.com/forms/d/e/1FAIpQLSedRl841nlaniRCLm-I60VLL1tmHRC1Rd6j-eDNZZSNA8QzXQ/viewform?usp=sf_link";
  static const donationPaypalLink =
      "https://www.paypal.com/donate/?hosted_button_id=FYZYTW723Q8QC";
  static const donationPatreaonLink = "https://www.patreon.com/SongLib";

  static const appTitle = "SongLib";
  static const appVersion = "v0.0.7.58";
  static const appCredits1 = "Siro";
  static const appCredits2 = "Titus";
  static const IconData whatsapp =
      IconData(0xf05a6, fontFamily: 'MaterialIcons');

  static Future<String> get databaseFile async {
    Directory dbFolder = await getApplicationDocumentsDirectory();
    if (isDesktop) {
      dbFolder = await getApplicationSupportDirectory();
    }

    var dbPath = join(dbFolder.path, AppConstants.dbName);
    logger('Opening database from: $dbPath');
    return dbPath;
  }
}
