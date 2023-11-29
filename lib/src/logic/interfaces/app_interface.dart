import '../../utils/enums/enums.dart';
import '../models/app/post/payload/comment_payload.dart';
import '../models/app/post/payload/react_payload.dart';
import '../models/app/post/payload/view_payload.dart';

mixin AppInterface {
  Future<(Map<String, dynamic>?, ResponseType)> getAllPosts(
      {Map<String, dynamic>? queryParams});

  Future<(Map<String, dynamic>?, ResponseType)> comment(
      CommentPayload commentPayLoad);

  Future<(Map<String, dynamic>?, ResponseType)> react(
      ReactPayload reactPayload);

  Future<(Map<String, dynamic>?, ResponseType)> view(ViewPayload viewPayload);

  Future<(Map<String, dynamic>?, ResponseType)> getCountries();

  Future<(Map<String, dynamic>?, ResponseType)> getViews({int? id});

  Future<(Map<String, dynamic>?, ResponseType)> getComment(
      {int? id, String? type});

  Future<(Map<String, dynamic>?, ResponseType)> getReaction(
      {int? id, String? type});
}
