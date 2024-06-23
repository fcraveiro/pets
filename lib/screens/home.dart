import 'dart:developer';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '_components/star_rate/star_rate.dart';
import '_components/temporary.dart';
import '_components/text_styles/text_styles.dart';
import '../data/memory/home_repository_memory.dart';
import '../domain/types/colors_app.dart';
import '_scaffold/scaffold_home.dart';

class HomeController extends Controller {
  ScaffoldHomeController scaffoldHomeController = ScaffoldHomeController();
  HomeRepositoryMemory homeRepositoryMemory = HomeRepositoryMemory();
  Notifier<bool> loadingStores = Notifier(true);
  Map<String, List<Map<String, dynamic>>> groupedData = {};
  int indexReverse = 0;
  @override
  onInit() {
    configScaffoldApp();
    readData();
  }

  readData() {
    loadingStores.value = true;
    groupedData = homeRepositoryMemory.loadAll();
    loadingStores.value = false;
  }

  configScaffoldApp() {
    scaffoldHomeController.title.value = 'Serviços';
  }

  @override
  onClose() {}
}

class HomeView extends ViewOf<HomeController> {
  HomeView({required super.controller, super.size});
  @override
  Widget build(BuildContext context) {
    return ScaffoldHomeView(
      controller: controller.scaffoldHomeController,
      child: controller.loadingStores.show(
        (isLoading) => isLoading
            ? const Center(child: CircularProgressIndicator())
            : buildMainUI(),
      ),
    );
  }

  Widget buildMainUI() {
    return SizedBox(
      width: size.width(100),
      height: size.height(100),
      child: Column(
        children: [
          buildMainUISection(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                  top: size.height(1.5), bottom: size.height(6)),
              itemCount: controller.groupedData.keys.length,
              itemBuilder: (context, index) {
                String serviceName =
                    controller.groupedData.keys.elementAt(index);
                List<Map<String, dynamic>> stores =
                    controller.groupedData[serviceName]!;
                return buildServiceSection(serviceName, stores);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMainUISection() {
    return Container(
        width: size.width(100),
        height: size.height(30),
        color: ColorApp().primary,
        child: Center(
            child: Container(
                width: size.width(95),
                height: size.height(28),
                decoration: BoxDecoration(
                  color: ColorApp().fundo03,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ))));
  }

  Widget buildServiceSection(
      String serviceName, List<Map<String, dynamic>> stores) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: size.width(4), top: size.height(1)),
          child: Row(
            children: [
              Container(
                  width: size.width(7),
                  height: size.height(3),
                  decoration: BoxDecoration(
                      color: ColorApp().fundo04,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(size.width(1.5)),
                          bottomLeft: Radius.circular(size.width(1.5)))),
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: ColorApp().degradeIcon,
                    size: size.height(2.3),
                  )),
              Container(
                  width: size.width(84),
                  height: size.height(3),
                  padding: EdgeInsets.only(left: size.width(2)),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorApp().fundo04,
                          ColorApp().fundo02,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(size.width(3)),
                          bottomRight: Radius.circular(size.width(3)))),
                  child: Text(serviceName.serviceName,
                      style: GFont().normalDarkText(15))),
            ],
          ),
        ),
        SizedBox(
          height: size.height(17),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stores.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Center(
                  child: Container(
                    width: size.width(32),
                    height: size.height(15.2),
                    margin: EdgeInsets.only(
                      top: size.height(1),
                      left: size.width(5),
                      right: size.width(.5),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width(3)),
                      color: ColorApp().fundo03,
                      image: DecorationImage(
                        image: NetworkImage(serviceName.urlImage),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: ColorApp().containerBackground,
                        width: size.width(.5),
                      ),
                    ),
                  ),
                );
              } else {
                Map<String, dynamic> store = stores[index - 1];
                return buildStoreCard(store, serviceName);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget buildStoreCard(Map<String, dynamic> store, String serviceName) {
    return storeCard(store, serviceName);
  }

  Widget storeCard(Map<String, dynamic> store, String serviceName) {
    final image = store['image'];
    final isImageNull = image == null;
    final imageUrl = isImageNull ? null : image;
    final borderColor = serviceName.priorityNumber == 100
        ? ColorApp().fundo06
        : ColorApp().fundo04;
    final imageWidget = isImageNull
        ? SizedBox(
            width: size.height(7),
            height: size.height(7),
          )
        : Container(
            width: size.height(5),
            height: size.height(5),
            margin: EdgeInsets.only(top: size.height(0), right: size.width(2)),
            color: ColorApp().primary,
            child: Image.network(
              imageUrl,
              width: size.height(5),
              height: size.height(5),
              fit: BoxFit.contain,
            ),
          );
    return GestureDetector(
      onTap: () {
        print('storeCard: onTap store: $store, serviceName: $serviceName');
        log(store.toString());
      },
      child: Center(
        child: Container(
          width: size.width(44),
          height: size.height(15),
          margin: EdgeInsets.only(
            top: size.height(1),
            left: size.width(3),
            right: size.width(1),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width(3)),
            border: Border.all(color: borderColor, width: size.width(.5)),
            color: ColorApp().fundo03,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: size.width(1.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width(27),
                          height: size.height(2.3),
                          alignment: Alignment.center,
                          child: starRate(decimalRandom(), size.width(4)),
                        ),
                        Container(
                          width: size.width(27),
                          height: size.height(2.3),
                          alignment: Alignment.center,
                          child: Text(
                            '(${inteiro().toString()})',
                            style: GFont().normalSecondary(11),
                          ),
                        ),
                        Container(
                          width: size.width(27),
                          height: size.height(2.9),
                          alignment: Alignment.center,
                          child: Text(
                            store['phones'][0],
                            style: GFont().noticePrimary(10),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.topRight,
                      child: imageWidget,
                    ),
                  ],
                ),
                SizedBox(height: size.height(.9)),
                Text(
                  store['bairro'],
                  style: GFont().noticeSecondary(12),
                ),
                SizedBox(height: size.height(.5)),
                Text(
                  store['name'],
                  style: GFont().noticePrimary(11),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension PriorityStringExtension on String {
  String get serviceName {
    return split(' - ').first;
  }

  int get priorityNumber {
    var parts = split(' - ');
    return int.tryParse(parts[1]) ?? 0;
  }

  String get urlImage {
    var parts = split(' - ');
    return parts[2];
  }
}
