import 'package:booking_system/business_logic/cubit/booking_cubit.dart';
import 'package:booking_system/business_logic/cubit/branch_cubit.dart';
import 'package:booking_system/business_logic/cubit/room_cubit.dart';
import 'package:booking_system/business_logic/cubit/roombooked_cubit.dart';
import 'package:booking_system/business_logic/cubit/user_cubit.dart';
import 'package:booking_system/presentation/pages/book/choose_branch_page.dart';
import 'package:booking_system/presentation/pages/book/choose_room_page.dart';
import 'package:booking_system/presentation/pages/book/report_day_page.dart';
import 'package:flutter/material.dart';
import 'package:booking_system/data/repository/database_repository.dart';

import 'package:booking_system/presentation/pages/home/home_page.dart';
import 'package:booking_system/presentation/pages/home/info_home_page.dart';
import 'package:booking_system/presentation/pages/home/splash_page.dart';
import 'package:booking_system/presentation/pages/login_system/change_password_page.dart';
import 'package:booking_system/presentation/pages/login_system/forgot_password_page.dart';
import 'package:booking_system/presentation/pages/login_system/login_page.dart';
import 'package:booking_system/presentation/pages/login_system/profile_view_edit_page.dart';
import 'package:booking_system/presentation/pages/search/search_page.dart';
import 'package:booking_system/presentation/pages/settings/settings_app_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late DatabaseRepository databaseRepository;

  AppRouter() {
    databaseRepository = DatabaseRepository();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<UserCubit>(
            create: (_) => UserCubit(databaseRepository),
            child: SplashPage(),
          ),
          settings: settings,
        );

      case InfoHomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => const InfoHomePage(),
          settings: settings,
        );

      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<UserCubit>(
            create: (_) => UserCubit(databaseRepository),
            child: const LoginPage(),
          ),
          settings: settings,
        );

      case ChooseBranchPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BranchCubit>(
            create: (_) => BranchCubit(databaseRepository),
            child: const ChooseBranchPage(),
          ),
          settings: settings,
        );

      case ChooseRoomPage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<RoomCubit>(
                create: (_) => RoomCubit(databaseRepository),
              ),
              BlocProvider(
                create: (context) => BookingCubit(databaseRepository),
              ),
            ],
            child: const ChooseRoomPage(),
          ),
          settings: settings,
        );

      case ForgotPasswordPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordPage(),
          settings: settings,
        );

      case ChangePasswordPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordPage(),
          settings: settings,
        );

      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BranchCubit(databaseRepository),
              ),
              BlocProvider(
                create: (context) => BookingCubit(databaseRepository),
              ),
            ],
            child: const HomePage(),
          ),
          settings: settings,
        );

      case SearchPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const SearchPage(),
          settings: settings,
        );

      case SetingsAppPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const SetingsAppPage(),
          settings: settings,
        );

      case ProfileViewEditPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<UserCubit>(
            create: (_) => UserCubit(databaseRepository),
            child: const ProfileViewEditPage(),
          ),
          settings: settings,
        );
      case ReportDayPage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => RoomCubit(databaseRepository),
              ),
              BlocProvider(
                create: (context) => RoomBookedCubit(databaseRepository),
              ),
            ],
            child: const ReportDayPage(),
          ),
          settings: settings,
        );
    }
  }
}
