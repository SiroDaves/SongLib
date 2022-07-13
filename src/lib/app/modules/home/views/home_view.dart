import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final GetStorage userData = GetStorage();
  final MyDatabase database;
  Size? size;

  HomeView({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.db = database;
    size = Get.size;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        child: GetBuilder<HomeController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
                titleBox(),
                songSearch(context),
                bookList(context),
                songList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget titleBox() {
    return SizedBox(
      height: size!.height * 0.125,
      child: Center(
        child: Text(
          AppConstants.appTitle,
          style: titleTextStyle.copyWith(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget songSearch(BuildContext context) {
    return FutureBuilder<List<Song>?>(
      future: controller.fetchSongList(),
      builder: (BuildContext context, AsyncSnapshot<List<Song>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return SearchView(songs: snapshot.data!, height: size!.height);
          } else {
            return Container();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return const CircularProgress();
        }
      },
    );
  }

  Widget bookList(BuildContext context) {
    return FutureBuilder<List<Book>?>(
      future: controller.fetchBookList(),
      builder: (BuildContext context, AsyncSnapshot<List<Book>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return SizedBox(
              height: size!.height * 0.125,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) =>  SongBook(
                  book: snapshot.data![index],
                ),
                itemCount: snapshot.data!.length,
                controller: controller.bookListScrollController,
              ),
            );
          } else {
            return Container();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return const CircularProgress();
        }
      },
    );
  }

  Widget songList(BuildContext context) {
    return FutureBuilder<List<Song>?>(
      future: controller.fetchSongList(),
      builder: (BuildContext context, AsyncSnapshot<List<Song>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return SizedBox(
              height: size!.height * 0.6125,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) => SongItem(
                  song: snapshot.data![index],
                ),
                itemCount: snapshot.data!.length,
                controller: controller.songListScrollController,
              ),
            );
          } else {
            return noSongData();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return const CircularProgress();
        }
      },
    );
  }

  Widget noSongData() {
    return Center(
      child: Column(
        children: [
          titleBox(),
          const Center(
            child: Text("Its empty here, no songs yet"),
          ),
        ],
      ),
    );
  }
}
