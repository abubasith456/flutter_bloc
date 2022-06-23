import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/model/summary_model.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/api_repo.dart';

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<CovidEvent>((event, emit) async {
      try {
        emit(CovidLoadingState());
        final mList = await _apiRepository.fetchCovidList();
        emit(CovidLoadedState(mList));
        if (mList.error != null) {
          emit(CovidError(mList.error!));
        }
      } on NetworkError {
        emit(const CovidError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
