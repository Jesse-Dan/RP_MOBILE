import 'package:recenth_posts/src/logic/interfaces/app_interface.dart';

import '../../../utils/enums/enums.dart';
import '../../core/client.dart';
import '../../models/app/post/payload/comment_payload.dart';
import '../../models/app/post/payload/react_payload.dart';
import '../../models/app/post/payload/view_payload.dart';

class AppRepository implements AppInterface {
  ApiClient appClient = ApiClient();

  @override
  Future<(Map<String, dynamic>?, ResponseType)> getAllPosts(
      {Map<String, dynamic>? queryParams}) async {
    var res = await appClient.sendRequest(endpoint: 'app/posts/', isAuth: true);
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> comment(
      CommentPayload commentPayLoad) async {
    var res = await appClient.sendRequest(
        endpoint: 'app/posts/comment',
        isAuth: true,
        method: HttpMethod.post,
        body: commentPayLoad.toJson());
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> react(
      ReactPayload reactPayload) async {
    var res = await appClient.sendRequest(
        endpoint: 'app/posts/react',
        isAuth: true,
        method: HttpMethod.post,
        body: reactPayload.toJson());
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> view(
      ViewPayload viewPayLoad) async {
    var res = await appClient.sendRequest(
        endpoint: 'app/posts/view',
        isAuth: true,
        method: HttpMethod.post,
        body: viewPayLoad.toJson());
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> getCountries() async {
    var res = await appClient.sendRequest(endpoint: 'countries/all');
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> getComment(
      {int? id, String? type}) async {
    var res = await appClient.sendRequest(
        endpoint: '/app/posts/post/comment/$id/$type', isAuth: true);
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> getReaction(
      {int? id, String? type}) async {
    var res = await appClient.sendRequest(
        endpoint: '/app/posts/post/reaction/$id/$type', isAuth: true);
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> getViews({int? id}) async {
    var res = await appClient.sendRequest(
        endpoint: '/app/posts/post/view/$id', isAuth: true);
    return res;
  }
}
