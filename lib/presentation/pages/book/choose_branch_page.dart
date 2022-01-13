import 'package:booking_system/business_logic/cubit/branch_cubit.dart';
import 'package:booking_system/data/models/hotel/branch.dart';
import 'package:booking_system/presentation/widgets/branch/branch_item.dart';
import 'package:booking_system/presentation/widgets/home/app_tool_bar.dart';
import 'package:booking_system/presentation/widgets/home/splash_loading.dart';
import 'package:booking_system/presentation/widgets/search/search_input_field.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseBranchPage extends StatefulWidget {
  const ChooseBranchPage({Key? key}) : super(key: key);
  static const routeName = '/branch';

  @override
  State<ChooseBranchPage> createState() => _ChooseBranchPageState();
}

class _ChooseBranchPageState extends State<ChooseBranchPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BranchCubit>(context).selectAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppToolBar(
              showMnue: (context) {},
              title: translate('Branchs'),
              back: () {
                Navigator.of(context).pop();
              },
            ),
            BlocBuilder<BranchCubit, BranchState>(
              builder: (context, state) {
                if (state is BranchSelectedAll) {
                  return _viewAll(state.branchs);
                } else if (state is BranchInitial) {
                  return const SplahLoading();
                } else {
                  return Center(
                    child: TextView(
                      text: (state as BranchError).error,
                      style: AppStyle().textStyle1,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded _viewAll(List<Branch> branchs) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SearchInputField(
              onChanged: (val) {},
            ),
            Expanded(
              child: ListView.builder(
                itemCount: branchs.length,
                itemBuilder: (context, index) {
                  return BranchItem(branch: branchs[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
