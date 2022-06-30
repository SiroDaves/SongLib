import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../exports.dart';

/// Home screen after Home
// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final GetStorage userData = GetStorage();
  Size? size;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;
    controller.fetchBooks();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.homeTitle,
          style: appBarTextStyle.copyWith(fontSize: 25),
        ),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.search),
            ),
            onTap: () {
              showSearch(
                context: context,
                delegate: SearchDelegater(),
              );
            },
          ),
        ],
      ),
      body: SizedBox(
        child: bookList(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => TodosView(),
            transition: Transition.rightToLeft,
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  Widget bookList(BuildContext context) {
    return FutureBuilder<List<Book>?>(
      future: controller.fetchBooks(),
      builder: (BuildContext context, AsyncSnapshot<List<Book>?> snapshot) {
        Widget? widget;

        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => buildItem(
                context,
                snapshot.data![index],
              ),
              itemCount: snapshot.data!.length,
              controller: controller.listScrollController,
            );
          } else {
            return const Center(
              child: Text("Its emply here, no books yet"),
            );
          }
        } else if (snapshot.hasError) {
          widget = Container();
        } else {
          widget = const CircularProgress();
        }
        return widget;
      },
    );
  }

  Widget buildItem(BuildContext context, Book setBook) {
    return SizedBox(
      height: 50,
      child: ListTile(
        leading: const Icon(Icons.book),
        title: Text(
          setBook.title!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          setBook.subtitle!,
          style: const TextStyle(fontSize: 14),
        ),
        onTap: () {
          Get.to(
            () => TodosView(currentBook: setBook),
            transition: Transition.rightToLeft,
          );
        },
      ),
    );
  }
}
