import 'package:recenth_posts/src/logic/core/client/client.dart';
import 'package:recenth_posts/src/logic/interfaces/post_interface.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';
import 'package:recenth_posts/src/logic/models/service/base_response.dart';

class PostRepository implements PostInterface  {
  AppClient appClient = AppClient();
  String urlPrefix = 'app/posts';

  @override
  Future<BaseResponse<PostResponse>> getAllPosts(
      {Map<String, dynamic>? queryParams}) async {
    BaseResponse<PostResponse> res =
        await appClient.get(urlPrefix) as BaseResponse<PostResponse>;
    return res;
  }

  @override
  Future<BaseResponse<PostResponse>> comment() {
    // TODO: implement comment
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<PostResponse>> react() {
    // TODO: implement react
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<PostResponse>> view() {
    // TODO: implement view
    throw UnimplementedError();
  }
}
