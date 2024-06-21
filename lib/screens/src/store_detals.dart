import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '../../components/star_rate/star_rate.dart';
import '../../components/temporary.dart';
import '../../components/text_styles/text_styles.dart';
import '../../data/memory/store_repository_memory.dart';
import '../scaffold/scaffold_app.dart';

class StoreDetalsController extends Controller {
  final StoreRepositoryMemory storeMemory = StoreRepositoryMemory();
  ScaffoldAppController scaffoldAppController = ScaffoldAppController();
  Notifier<Map<String, dynamic>> stores = Notifier({});

  @override
  onInit() {
    configScaffoldApp();
    getStore();
  }

  configScaffoldApp() {
    scaffoldAppController.title.value = 'Detalhes da Loja';
  }

  getStore() {
    stores.value = storeMemory.loadAll();
  }

  @override
  onClose() {}
}

class StoreDetalsView extends ViewOf<StoreDetalsController> {
  StoreDetalsView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppView(
        controller: controller.scaffoldAppController,
        child: controller.stores.show((store) => SafeArea(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width(3.5), vertical: size.height(4)),
                    child: Card(
                      color: const Color(0xFF505B7B),
                      surfaceTintColor: const Color(0xFF505B7B),
                      shadowColor: Colors.black,
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height(1)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width(57),
                                height: size.height(15.1),
                                // color: Colors.blue.shade100,
                                margin: EdgeInsets.only(
                                    left: size.width(2.5), top: size.height(1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(store['bairro'],
                                        style: GFont().normalDarkText(16)),
                                    SizedBox(height: size.height(.7)),
                                    Text('Horário : 24 Hs',
                                        style: GFont().noticeDarkText(13)),
                                    SizedBox(height: size.height(1.1)),
                                    Text(
                                      store['phones'].join(' - '),
                                      style: GFont().noticeDarkText(12),
                                    ),
                                    const Spacer(),
                                    Center(
                                      child: Container(
                                        width: size.width(34),
                                        height: size.height(4.5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade600,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: Colors.white70),
                                        ),
                                        child: Text('WhatsApp',
                                            style: GFont().noticeWhiteText(15)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: size.width(28),
                                height: size.height(16.5),
                                margin: EdgeInsets.only(
                                    right: size.width(2.5),
                                    top: size.height(1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      store['image'],
                                      width: size.width(20),
                                      height: size.width(20),
                                      fit: BoxFit.contain,
                                    ),
                                    Container(
                                        width: size.width(26),
                                        height: size.width(5),
                                        // color: Colors.pink,
                                        margin: EdgeInsets.only(
                                            top: size.height(.5),
                                            bottom: size.height(.3)),
                                        // alignment: Alignment.center,
                                        child: starRate(
                                            decimalRandom(), size.width(4.5))),
                                    Text('(${inteiro().toString()})',
                                        style: GFont().noticeWhiteText(12)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height(.5)),
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade300,
                            indent: size.width(3.5),
                            endIndent: size.width(3.5),
                          ),
                          SizedBox(height: size.height(.5)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width(3.5),
                                vertical: size.height(.5)),
                            child: Text(
                              store['name'],
                              style: GFont().noticeDarkText(16),
                            ),
                          ),
                          SizedBox(height: size.height(1)),
                          Center(
                            child: Container(
                              width: size.width(100),
                              height: size.height(25),
                              // margin: EdgeInsets.only(
                              //     top: size.height(1), bottom: size.height(1)),
                              margin: EdgeInsets.only(
                                  left: size.width(2.5),
                                  right: size.width(2.5),
                                  top: size.height(1),
                                  bottom: size.height(1)),
                              // color: Colors.blue, aqui
                              child: Center(
                                child: Column(
                                  children: [
                                    Container(
                                      width: size.width(80),
                                      height: size.height(3),
                                      margin:
                                          EdgeInsets.only(top: size.height(1)),
                                      // color: Colors.yellow, aqui
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Wrap(
                            //   children: [
                            //     ...store.services
                            //         .map<Widget>((Service service) {
                            //       return buildChip(service.name, size);
                            //     }),
                            //   ],
                            // ),
                          ),
                          SizedBox(height: size.height(1)),
                          SizedBox(height: size.height(2)),
                          Center(
                            child: Container(
                              width: size.width(84),
                              height: size.height(14.5),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/maps.png'),
                                  colorFilter: ColorFilter.mode(
                                    Colors.yellow.withOpacity(0.3),
                                    BlendMode.dstOut,
                                  ),
                                  // p: como deixar a imagem mais trasnparente
                                  // r:

                                  fit: BoxFit.cover,
                                ),
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: size.width(37),
                                    height: size.height(4),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: Colors.white70,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Abrir Rotas',
                                        style: GFont().noticeWhiteText(15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height(1.5)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: size.width(37),
                                        height: size.height(6),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade800,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                            color: Colors.white70,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Google Maps',
                                            style: GFont().noticeWhiteText(15),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width(37),
                                        height: size.height(6),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade800,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: Colors.white70),
                                        ),
                                        child: Center(
                                          child: Text('Waze',
                                              style:
                                                  GFont().noticeWhiteText(15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height(1.5)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height(3)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
  }
}
