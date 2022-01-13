import 'package:bloc/bloc.dart';
import 'package:booking_system/data/models/booking/room_booked.dart';
import 'package:booking_system/data/models/hotel/room.dart';

import 'package:booking_system/data/repository/database_repository.dart';
import 'package:booking_system/utils/constants/utils.dart';

part 'roombooked_state.dart';

class RoomBookedCubit extends Cubit<RoomBookedState> {
  DatabaseRepository databaseRepository;
  RoomBookedCubit(
    this.databaseRepository,
  ) : super(RoomBookedInitial());

  findroomBookedAll() {
    databaseRepository.findroomBookedAll()!.then((value) {
      print(value);
      if (value != null && value.isNotEmpty) {
        emit(RoomBookedSelectAll(roomBookeds: value));
      } else {
        emit(RoomBookedError(error: 'Not Found'));
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(RoomBookedError(error: translate('NotFound')));
    });
  }

  findRooms(DateTime date) {
    databaseRepository.findRooms(date)!.then((value) {
      print(value);
      if (value != null && value.isNotEmpty) {
        emit(RoomSelectAll(rooms: value));
        print('Booked ' + value.toString());
      } else {
        emit(RoomBookedError(error: 'Not Found'));
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(RoomBookedError(error: translate('NotFound')));
    });
  }
}
