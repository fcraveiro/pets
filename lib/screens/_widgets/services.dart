import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';

Widget widgetServices(store, Sizer size) {
  // log('LENGTH ${store['activity'].toString()}');
  return const Wrap(children: [
    // ...store['services'].map((activity) => Container(
    //     height: size.height(2.5),
    //     margin: EdgeInsets.only(right: size.width(2)),
    //     padding: EdgeInsets.symmetric(horizontal: size.width(2)),
    //     decoration: BoxDecoration(
    //       color: Colors.grey.shade200,
    //       borderRadius: BorderRadius.circular(5),
    //     ),
    //     child:
    Text('activity'),
    //       )),
  ]);
  // );
}

        // Wrap(
                    //             //   children: [
                    //             //     ...store.services
                    //             //         .map<Widget>((Service service) {
                    //             //       return buildChip(service., size);
                    //             //     }),
                    //             //   ],
                    //             // ),
                    //           ],