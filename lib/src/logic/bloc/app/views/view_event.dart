// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;
import 'package:meta/meta.dart';

import 'package:recenth_posts/src/logic/models/app/post/res/view_response.dart';
import '../../../../utils/enums/enums.dart';
import '../../../models/app/post/payload/view_payload.dart';

import '../../../models/service/un_auth_response.dart';
import '../../../repository/app/app_repo.dart';
import '../../../services/logger/logger.dart';

import 'view_bloc.dart';
import 'view_state.dart';

@immutable
abstract class ViewEvent {
  Stream<ViewState> applyAsync({ViewState currentState, ViewBloc bloc});
}

class ViewPostEvent extends ViewEvent {
  final AppRepository appRepository;
  final ViewPayload viewPayload;
  ViewPostEvent(this.appRepository, this.viewPayload);
  @override
  Stream<ViewState> applyAsync(
      {ViewState? currentState, ViewBloc? bloc}) async* {
    try {
      yield const ViewLoadingState();
      var res = await appRepository.view(viewPayload);
      if (res.$2 == ResponseType.Success) {
        var data = GeneralErrorResponse.fromJson(res.$1!);
        yield ViewLoadedState(message: data.message!);
      } else {
        if (res.$1 == null) {
          Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
          yield const ViewErrorState('UNKNOWN ERROR OCCURED');
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          GeneralErrorResponse err = GeneralErrorResponse.fromJson(res.$1!);
          yield ViewErrorState(err.message!);
        }
      }
      yield const ViewInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadViewEvent', error: _, stackTrace: stackTrace);
      yield ViewErrorState(_.toString());
    }
  }
}

class GetPostViewEvent extends ViewEvent {
  final AppRepository appRepository;
  final int id;
  GetPostViewEvent(this.appRepository, this.id);
  @override
  Stream<ViewState> applyAsync(
      {ViewState? currentState, ViewBloc? bloc}) async* {
    try {
      yield const ViewLoadingState();
      var res = await appRepository.getViews(id: id);
      if (res.$2 == ResponseType.Success) {
        var data = ViewResponse.fromJson(res.$1!);
        yield GetViewsLoadedState(views: data.data!);
      } else {
        if (res.$1 == null) {
          Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
          yield const ViewErrorState('UNKNOWN ERROR OCCURED');
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          GeneralErrorResponse err = GeneralErrorResponse.fromJson(res.$1!);
          yield ViewErrorState(err.message!);
        }
      }
      yield const ViewInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadViewEvent', error: _, stackTrace: stackTrace);
      yield ViewErrorState(_.toString());
    }
  }
}
