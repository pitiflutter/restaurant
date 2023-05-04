import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/common/exeptions.dart';
import 'package:restaurant/data/model/food.dart';
import 'package:restaurant/data/model/menu.dart';
import 'package:restaurant/data/repo/food_repository.dart';
import 'package:restaurant/data/repo/menu_repository.dart';
 
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FoodRepository foodRepository;
  final MenuRepository menuRepository;
  HomeBloc({required this.foodRepository, required this.menuRepository})
      : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        emit(HomeLoading());
        try {
          final List<Food> foods = await foodRepository.getAll();
          final List<Menu> menus = await menuRepository.getAll();
          emit(HomeSuccess(foods: foods, menus: menus));
          debugPrint("All foods and menus successfully recieved .");
        } catch (e) {
          emit(HomeError(e is AppExeptions ? e : AppExeptions()));
        }
      }
    });
  }
}
