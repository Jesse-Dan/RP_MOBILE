// ignore_for_file: non_constant_identifier_names

import 'package:recenth_posts/src/logic/interfaces/app_interface.dart';
import 'package:recenth_posts/src/view/app/posts/components/block_user/model/blocked_user_payload.dart';
import 'package:recenth_posts/src/view/app/posts/components/intrest/model/intrest.dart';
import 'package:recenth_posts/src/view/app/posts/components/mute/model/mute_payload.dart';
import 'package:recenth_posts/src/view/app/posts/components/polls/models/poll_vote_payload.dart';

import '../../../utils/enums/enums.dart';
import '../../../view/app/posts/components/comment/model/comment_payload.dart';
import '../../../view/app/posts/components/fav_post/model/fav_post.dart';
import '../../../view/app/posts/components/report/model/report_payload.dart';
import '../../../view/app/posts/components/star/model/star_payload.dart';
import '../../../view/app/posts/components/view/model/view_payload.dart';
import '../../core/client.dart';

class AppRepository implements AppInterface {
  ApiClient appClient = ApiClient();

  // Group 1: Post Management
  /// GET ALL POSTS
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> getAllPosts(
      {Map<String, dynamic>? queryParams}) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/get-posts', authenticated: true);
    return res;
  }

  /// GET FAVORITE POST
  Future<(Map<String, dynamic>?, ResponseType, String)> getFavPosts(
      {Map<String, dynamic>? queryParams}) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/get-posts', authenticated: true);
    return res;
  }

  /// GET USER CAMPUS POST
  Future<(Map<String, dynamic>?, ResponseType, String)> getCampusPosts(
      {Map<String, dynamic>? queryParams}) async {
    var res = await appClient.sendRequest(
      endpoint: 'post/get-posts',
      authenticated: true,
    );
    return res;
  }

  // Group 2: User Interaction
  /// REPORT
  Future<(Map<String, dynamic>?, ResponseType, String)> report(
      {required ReportPayload reportPayload}) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/report',
        authenticated: true,
        method: HttpMethod.post,
        body: reportPayload.toJson());

    return res;
  }

  /// COMMENT
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> comment(
      CommentPayload commentPayLoad) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/comment',
        authenticated: true,
        method: HttpMethod.post,
        body: commentPayLoad.toJson());
    return res;
  }

  /// STAR
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> star(
      StarPayload reactPayload) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/star',
        authenticated: true,
        method: HttpMethod.post,
        body: reactPayload.toJson());
    return res;
  }

  /// VOTE
  Future<(Map<String, dynamic>?, ResponseType, String)> vote(
      PollVotePayload payload) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/poll/vote',
        authenticated: true,
        method: HttpMethod.patch,
        body: payload.toJson());
    return res;
  }

  /// VIEW
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> view(
      ViewPayload viewPayLoad) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/view',
        authenticated: true,
        method: HttpMethod.post,
        body: viewPayLoad.toJson());
    return res;
  }

  /// BLOCK USER
  Future<(Map<String, dynamic>?, ResponseType, String)> block(
      BlockedPayload blockPayLoad) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/view',
        authenticated: true,
        method: HttpMethod.post,
        body: blockPayLoad.toJson());
    return res;
  }

  /// INTREST USER
  Future<(Map<String, dynamic>?, ResponseType, String)> intrest(
      IntrestPayload intrestPayload) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/view',
        authenticated: true,
        method: HttpMethod.post,
        body: intrestPayload.toJson());
    return res;
  }

  /// MUTE USER
  Future<(Map<String, dynamic>?, ResponseType, String)> mute(
      MutePayload mutePayload) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/mute',
        authenticated: true,
        method: HttpMethod.post,
        body: mutePayload.toJson());
    return res;
  }

  /// MUTE USER
  Future<(Map<String, dynamic>?, ResponseType, String)> favPost(
      FavPostPayload favPostPayload) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/add-to-fav',
        authenticated: true,
        method: HttpMethod.post,
        body: favPostPayload.toJson());
    return res;
  }

  // Group 3: Data retrieval by ID
  /// GET STARS BY ID
  Future<(Map<String, dynamic>?, ResponseType, String)> getStarsById(
      {required int ref_id, required String ref_name}) async {
    var res = await appClient.sendRequest(
      endpoint: 'post/get-stars/$ref_id/$ref_name',
      authenticated: true,
    );
    return res;
  }

  Future<(Map<String, dynamic>?, ResponseType, String)> getCommentById(
      (String, String) params) async {
    var res = await appClient.sendRequest(
        endpoint: 'post/get-comments/${params.$1}/${params.$2}',
        authenticated: true);
    return res;
  }

  // Group 4: Generic data retrieval
  /// GET COMMENT (with id and type parameters)
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> getComment(
      {int? id, String? type}) async {
    var res = await appClient.sendRequest(
        endpoint: '/app/posts/post/comment/$id/$type', authenticated: true);
    return res;
  }

  /// GET REACTION (with id and type parameters)
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> getReaction(
      {int? id, String? type}) async {
    var res = await appClient.sendRequest(
        endpoint: '/app/posts/post/reaction/$id/$type', authenticated: true);
    return res;
  }

  /// GET VIEWS
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> getViews(
      {int? id}) async {
    var res = await appClient.sendRequest(
        endpoint: '/app/posts/post/view/$id', authenticated: true);
    return res;
  }

  // Group 5: General data retrieval
  /// GET SCHOOLS
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> getSchools() async {
    var res = await appClient.sendRequest(endpoint: 'data/school');
    return res;
  }

  /// GET DEPARTMENTS
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> getDepartments() async {
    var res = await appClient.sendRequest(endpoint: 'data/departments');
    return res;
  }

  /// GET FACULTIES
  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> getFaculties() async {
    var res = await appClient.sendRequest(endpoint: 'data/faculty');
    return res;
  }
}
