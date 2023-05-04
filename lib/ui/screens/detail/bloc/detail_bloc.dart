import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/common/exeptions.dart';
import 'package:restaurant/data/model/food.dart';
import 'package:restaurant/data/repo/food_detail_rapository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final IFoodDetailRepository foodDetailRepository;
  final String foodId;
  DetailBloc({required this.foodDetailRepository, required this.foodId})
      : super(DetailLoading()) {
    on<DetailEvent>((event, emit) async {
      if (event is DetailStarted) {
        emit(DetailLoading());
        try {
          final FoodDetail foodDetail =
              await foodDetailRepository.getAll(foodId: foodId);
          emit(DetailSuccess(foodDetail));
        } catch (e) {
          print("error when fetch data");
          emit(DetailError(e is AppExeptions ? e : AppExeptions()));
        }
      }
    });
  }
}
