part of 'room_cubit.dart';

abstract class RoomState {}

class RoomInitial extends RoomState {}

class RoomElse extends RoomState {}

class RoomError extends RoomState {
  String error;
  RoomError({
    required this.error,
  });
}

class RoomSelectedAll extends RoomState {
  List<Room> rooms;
  RoomSelectedAll({
    required this.rooms,
  });
}
