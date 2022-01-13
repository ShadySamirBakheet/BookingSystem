import 'package:flutter/material.dart';
import 'package:booking_system/data/models/utils/slider_info.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';

class ItemPageView extends StatelessWidget {
  DataModel dataModel;

  ItemPageView({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

//hammocks.jpg
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                dataModel.imageUrl,
                width: 100,
              ),
              const SizedBox(
                height: 32,
              ),
              TextView(
                text: dataModel.title,
                style:
                    AppStyle().textStyle4.copyWith(fontWeight: FontWeight.bold),
              ),
              TextView(
                text: dataModel.desc,
                style:
                    AppStyle().textStyle4.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
