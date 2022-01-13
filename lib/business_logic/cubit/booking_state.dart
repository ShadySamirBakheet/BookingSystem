part of 'booking_cubit.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingError extends BookingState {
  String error;
  BookingError({
    required this.error,
  });
}

class BookingSelectAll extends BookingState {
  List<Booking> bookings;
  BookingSelectAll({
    required this.bookings,
  });
}

class BookingAdded extends BookingState {}

class BookingLoading extends BookingState {}
