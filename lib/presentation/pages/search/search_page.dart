import 'package:flutter/material.dart';
import 'package:booking_system/presentation/widgets/search/search_input_field.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key});
  static const routeName = '/search';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var con1 = Colors.grey.shade400;
  var con2 = Colors.grey.shade400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchInputField(
            onChanged: (val) {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: con1,
                  ),
                  child: TextView(
                    text: 'Courses',
                    action: () {
                      setState(() {
                        con1 = Theme.of(context).primaryColor;
                        con2 = Colors.grey.shade400;
                      });
                    },
                    style: AppStyle().textStyle1.copyWith(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: con2,
                  ),
                  child: TextView(
                    text: 'Lectures',
                    action: () {
                      setState(() {
                        con2 = Theme.of(context).primaryColor;
                        con1 = Colors.grey.shade400;
                      });
                    },
                    style: AppStyle().textStyle1.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              //mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 8),
                ...titles('Favoritecourses', 'عمل الروح القدس في حياة المؤمن'),
                favoLearn(),
                const SizedBox(height: 8),
                ...titles('FavoriteLecture', 'عمل الروح القدس في حياة المؤمن'),
                favoLecture(),
                const SizedBox(height: 8),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> titles(String title1, String title2, {bool isTop = false}) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextView(
          text: translate(title1),
          padding: const EdgeInsets.symmetric(vertical: 4),
          textAlign: TextAlign.start,
          style: AppStyle()
              .textStyle1
              .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ];
  }

  Widget favoLearn() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (ctx, index) => const SizedBox(
        height: 50,
      ),
    );
  }

  favoLecture() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (ctx, index) => const SizedBox(
        height: 50,
      ),
    );
  }
}
