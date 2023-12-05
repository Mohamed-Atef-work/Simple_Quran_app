import 'package:flutter/material.dart';
import '../components/golbelController/globelControler.dart';
import '../components/models/oneSourahDetailsModel.dart';
import '../sourahVersesScreen/view.dart';
import 'controller.dart';

class SourahNamesScreen extends StatefulWidget {
  const SourahNamesScreen({Key? key}) : super(key: key);

  @override
  State<SourahNamesScreen> createState() => _SourahNamesScreenState();
}

class _SourahNamesScreenState extends State<SourahNamesScreen> {
  final controller = SourahNamesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 75,
                ),
                child: ListView.builder(
                  itemCount: 114,
                  itemBuilder: (BuildContext context, int index) =>
                      FutureBuilder(
                    future: controller.getSourahDetails((index + 1).toString()),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var model = snapshot.data as SourahDetailsModel;
                        //controller.listSourahId[index] = model.chapter.id;

                        // controller.isDeleted = model.chapter.revelationPlace ==
                        //     controller.selectedPlace ||
                        //     controller.selectedPlace == "both" ? false: true;

                        return model.chapter.revelationPlace ==
                                    controller.selectedPlace ||
                                controller.selectedPlace == "both"
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    GlobalController.sourahId =
                                        (index + 1).toString();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SourahVersesScreen(),
                                        ));
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey[600],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          model.chapter.nameArabic,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 130,
                //height: ,
                child: DropdownButtonFormField<String>(
                  dropdownColor: Colors.grey,
                  focusColor: Colors.grey,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  value: controller.selectedPlace,
                  items: controller.places
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (item) {
                    setState(() {});
                    controller.selectedPlace = item.toString();
                    //print(controller.selectedPlace);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
