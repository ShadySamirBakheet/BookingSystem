import 'package:flutter/material.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SplahLoading extends StatelessWidget {
  const SplahLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/icon.png',
            width: 150,
          ),
          const SizedBox(
            height: 35,
          ),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 35,
          ),
          SkeletonAnimation(
            shimmerColor: Colors.white,
            borderRadius: BorderRadius.circular(32),
            shimmerDuration: 1000,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                //boxShadow: shadowList,
              ),
              child: Text(
                translate('Loading'),
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
