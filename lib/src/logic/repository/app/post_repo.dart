import 'package:recenth_posts/src/logic/interfaces/post_interface.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';
import 'package:recenth_posts/src/logic/models/service/base_response.dart';

import '../../../utils/constants/global_constants.dart';
import '../../core/client.dart';

class PostRepository implements PostInterface {
  ApiClient appClient = ApiClient();

  @override
  Future<BaseResponse<PostResponse>> getAllPosts(
      {Map<String, dynamic>? queryParams}) async {
    var call = await appClient.sendRequest(
      endpoint: GlobalConstants.POSTS_ENDPOINT,
    );

    var res = BaseResponse<PostResponse>.fromJson(
      call.$1!,
      (dynamic json) => PostResponse.fromJson(json),
    );
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
