part of 'roombooked_cubit.dart';

abstract class RoomBookedState {}

class RoomBookedInitial extends RoomBookedState {}

class RoomBookedError extends RoomBookedState {
  String error;
  RoomBookedError({
    required this.error,
  });
}

class RoomBookedSelectAll extends RoomBookedState {
  List<RoomBooked> roomBookeds;
  RoomBookedSelectAll({
    required this.roomBookeds,
  });
}

class RoomSelectAll extends RoomBookedState {
  List<Room> rooms;
  RoomSelectAll({
    required this.rooms,
  });
}
