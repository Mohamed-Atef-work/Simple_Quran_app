import 'package:flutter/material.dart';
import '../components/golbelController/globelControler.dart';
import '../components/models/oneSourahDetailsModel.dart';
import '../components/models/sourahVersesModel.dart';
import 'controller.dart';

class SourahVersesScreen extends StatefulWidget {
  const SourahVersesScreen({Key? key}) : super(key: key);

  @override
  State<SourahVersesScreen> createState() => _SourahVersesScreenState();
}

class _SourahVersesScreenState extends State<SourahVersesScreen> {
  final controller = SourahController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        title: const Text(
          "Quran",
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey[400],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future:
                      controller.getSourahDetails(GlobalController.sourahId),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var modelDetails = snapshot.data as SourahDetailsModel;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            modelDetails.chapter.nameArabic,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: controller.getSourahVerses(GlobalController.sourahId),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var model = snapshot.data as SourahVersesModel;

                      if (GlobalController.sourahId == "1") {
                        for (int loop = 1; loop < model.verses.length; loop++) {
                          controller.sourah = controller.sourah +
                              "  " +
                              model.verses[loop].textMadani +
                              " " +
                              model.verses[loop].verseKey;
                        }
                      }

                      else
                      {
                        for (int loop = 0; loop < model.verses.length; loop++) {
                          controller.sourah = controller.sourah +
                              "  " +
                              model.verses[loop].textMadani +
                              " " +
                              model.verses[loop].verseKey;
                        }
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder(
                            future: controller.getSourahVerses("1"),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.data == null) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                var model = snapshot.data as SourahVersesModel;

                                return Text(
                                  model.verses[0].textMadani,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            decoration: const BoxDecoration(
                                //borderRadius: ,
                                //shape: BoxShape.circle,
                                ),
                            child: Text(
                              controller.sourah,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey[400],
            ),
            child: FutureBuilder(
              future:
              controller.getSourahDetails(GlobalController.sourahId),
              builder: (BuildContext context,
                  AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var modelDetails = snapshot.data as SourahDetailsModel;

                  return Column(
                    children: [
                      Text(
                          "revelationPlace: ${modelDetails.chapter.revelationPlace}"),
                      Text(
                          "revelationOrder: ${modelDetails.chapter.revelationOrder}"),
                      Text(
                          "versesCount: ${modelDetails.chapter.versesCount.toString()}"),
                      Text(
                          "pages: ${modelDetails.chapter.pages.toString()}"),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
// drawer: SafeArea(
//   child: Drawer(
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: Colors.grey[400],
//       ),
//       child: FutureBuilder(
//           future: controller.getAllSourahNames(),
//           builder:
//               (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//             if (snapshot.data == null) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               var modelNames = snapshot.data as RecitationsModel;
//
//               print(snapshot.data);
//               // for(int loop = 0 ; loop < modelNames.chapters.length; loop++)
//               // {
//               //   controller.names[loop] = modelNames.chapters[loop].nameArabic;
//               //   //print(controller.names[0]);
//               // }
//
//               return ListView.separated(
//                 itemBuilder: (BuildContext context, int index) =>
//                     TextButton(
//                         onPressed: () {
//                           controller.recitationId =
//                               modelNames.recitations[index].id;
//                         },
//                         child: Text(
//                             modelNames
//                                 .recitations[index].translatedName.name,
//                             style: const TextStyle(
//                                 fontSize: 20, color: Colors.black))),
//                 itemCount: modelNames.recitations.length,
//                 separatorBuilder: (BuildContext context, int index) =>
//                     const SizedBox(
//                   height: 3,
//                   child: Divider(
//                     indent: 30,
//                     endIndent: 30,
//                     thickness: 1,
//                   ),
//                 ),
//               );
//             }
//           }),
//     ),
//   ),
// ),
