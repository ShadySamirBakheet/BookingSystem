import 'package:bloc/bloc.dart';
import 'package:booking_system/data/models/hotel/branch.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:equatable/equatable.dart';

import 'package:booking_system/data/repository/database_repository.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  DatabaseRepository databaseRepository;
  BranchCubit(
    this.databaseRepository,
  ) : super(BranchInitial());

  void selectAll() {
    databaseRepository.findAllbranchs()!.then((value) {
      if (value != null && value.isNotEmpty) {
        emit(BranchSelectedAll(branchs: value));
      } else {
        emit(BranchError(error: translate('NotFound')));
      }
    });
  }
}
