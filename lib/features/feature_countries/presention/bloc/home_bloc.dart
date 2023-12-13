import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:countries/core/resources/data-state.dart';
import 'package:countries/features/feature_countries/domain/repository/countries_repository.dart';
import 'package:countries/features/feature_countries/presention/bloc/country-status.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/countries_entity.dart';
import '../../domain/use_cases/get_countries_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCountriesUseCase getCountriesUseCase;

  HomeBloc(this.getCountriesUseCase) : super(CountriesInitial()) {
    on<LoadCountryEvent>((event, emit) async {
      emit(CountriesLoading());
      print('loading');

      try {
        final dataState = await getCountriesUseCase();
        emit(CountriesLoaded(dataState));
        print('loaded');
      } catch (e) {
        emit(CountriesError(e.toString()));
        print('error');

      }
    });
  }
}
