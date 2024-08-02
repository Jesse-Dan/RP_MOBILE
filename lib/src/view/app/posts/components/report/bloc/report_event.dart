// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:meta/meta.dart';

import '../model/report_payload.dart';
import 'report_bloc.dart';
import 'report_state.dart';

@immutable
abstract class ReportEvent {
  Stream<ReportState> applyAsync({ReportState currentState, ReportBloc bloc});
}

class UnReportEvent extends ReportEvent {
  @override
  Stream<ReportState> applyAsync(
      {ReportState? currentState, ReportBloc? bloc}) async* {
    yield const InitialReportState();
  }
}

class ReportActionEvent extends ReportEvent {
  final ReportPayload reportPayload;

  ReportActionEvent(this.reportPayload);
  @override
  Stream<ReportState> applyAsync(
      {ReportState? currentState, ReportBloc? bloc}) async* {
    try {
      yield const InitialReportState();
      Logger.log(
          tag: Tag.BLOC_EVENT, message: reportPayloadToJson(reportPayload));
      var res = await AppRepository().report(reportPayload: reportPayload);
      if (res.$1?['statusCode'] == 201) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.toString());
        yield InReportState(resVal);
      } else {
        yield ErrorReportState(res.$1!['message']);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadReportEvent', error: _, stackTrace: stackTrace);
      yield ErrorReportState(_.toString());
    }
  }
}
