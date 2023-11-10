import 'package:recenth_posts/src/logic/models/service/base_response.dart';

import '../models/app/post/res/get_all_post_response.dart';

mixin PostInterface {
  Future<BaseResponse<PostResponse>> getAllPosts({ Map<String, dynamic>? queryParams});

  Future<BaseResponse<PostResponse>> comment();

  Future<BaseResponse<PostResponse>> react();

  Future<BaseResponse<PostResponse>> view();
}
