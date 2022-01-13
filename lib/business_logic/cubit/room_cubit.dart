import 'package:bloc/bloc.dart';
import 'package:booking_system/data/models/hotel/room.dart';

import 'package:booking_system/data/repository/database_repository.dart';
import 'package:booking_system/utils/constants/utils.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  DatabaseRepository databaseRepository;
  RoomCubit(
    this.databaseRepository,
  ) : super(RoomInitial());

  void selectAll(int bid) {
    databaseRepository.findAllRoomsBranch(bid)!.then((value) {
      if (value != null && value.isNotEmpty) {
        emit(RoomSelectedAll(rooms: value));
      } else {
        emit(RoomError(error: translate('NotFound')));
      }
    });
  }

  void findAllRooms(DateTime dateTime) {
    databaseRepository.findAllRooms(dateTime)!.then((value) {
      if (value != null && value.isNotEmpty) {
        emit(RoomSelectedAll(rooms: value));
        print(value);
      } else {
        emit(RoomError(error: translate('NotFound')));
      }
    });
  }

  remove() {
    emit(RoomElse());
  }
}
