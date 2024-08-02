import '../../utils/enums/enums.dart';
import '../../view/app/posts/components/comment/model/comment_payload.dart';
import '../../view/app/posts/components/star/model/star_payload.dart';
import '../../view/app/posts/components/view/model/view_payload.dart';


mixin AppInterface {
  Future<(Map<String, dynamic>?, ResponseType, String)> getAllPosts(
      {Map<String, dynamic>? queryParams});

  Future<(Map<String, dynamic>?, ResponseType, String)> comment(
      CommentPayload commentPayLoad);

  Future<(Map<String, dynamic>?, ResponseType, String)> star(
      StarPayload reactPayload);

  Future<(Map<String, dynamic>?, ResponseType, String)> view(
      ViewPayload viewPayload);

  Future<(Map<String, dynamic>?, ResponseType, String)> getViews({int? id});

  Future<(Map<String, dynamic>?, ResponseType, String)> getComment(
      {int? id, String? type});

  Future<(Map<String, dynamic>?, ResponseType, String)> getReaction(
      {int? id, String? type});

  Future<(Map<String, dynamic>?, ResponseType, String)> getSchools();
  Future<(Map<String, dynamic>?, ResponseType, String)> getFaculties();
  Future<(Map<String, dynamic>?, ResponseType, String)> getDepartments();
}
