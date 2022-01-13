part of 'branch_cubit.dart';

abstract class BranchState extends Equatable {
  const BranchState();

  @override
  List<Object> get props => [];
}

class BranchInitial extends BranchState {}

class BranchError extends BranchState {
  String error;
  BranchError({
    required this.error,
  });
}

class BranchSelectedAll extends BranchState {
  List<Branch> branchs;
  BranchSelectedAll({
    required this.branchs,
  });
}
