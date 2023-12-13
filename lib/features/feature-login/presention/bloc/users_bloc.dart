import 'package:bloc/bloc.dart';
import 'package:countries/features/feature-login/data/repository/users_repositoryimpl.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepositoryImpl usersRepositoryImpl;

  UsersBloc(this.usersRepositoryImpl) : super(UsersInitial()) {
    on<LoadUsersEvent>((event, emit) {
      emit(UsersLoading());
      if (usersRepositoryImpl.fetchUsersData(event.email) == true) {
        emit(UsersLoaded(usersRepositoryImpl));
      } else {
        emit(UsersError('error'));
      }
    });
  }
}
