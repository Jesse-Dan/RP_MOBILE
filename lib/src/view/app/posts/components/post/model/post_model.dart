import 'package:json_annotation/json_annotation.dart';
import '../../../../../../logic/models/app/user_model.dart';
import '../../comment/model/comment.dart';
import '../../polls/models/poll_option.dart';
import '../../polls/models/poll_vote.dart';
import '../../star/model/star.dart';
import '../../view/model/view.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'poll_question')
  String? pollQuestion;
  String? state;
  String? city;
  @JsonKey(name:'post_type')
  String? postType;
  String? device;
  @JsonKey(name: 'expires_at')
  DateTime? expiresAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  List<Comment?>? comments;
  List<Star>? stars;
  List<View>? views;
  List<PollOption>? options;
  User? user;
  List<PollVote>? votes;
  String? subject;
  String? content;
  dynamic link;

  Post({
    this.id,
    this.userId,
    this.pollQuestion,
    this.state,
    this.city,
    this.device,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
    this.comments,
    this.stars,
    this.views,
    this.options,
    this.user,
    this.votes,
    this.subject,
    this.content,
    this.link,
  });

  Post copyWith({
    int? id,
    int? userId,
    String? pollQuestion,
    String? state,
    String? city,
    String? device,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Comment>? comments,
    List<Star>? stars,
    List<View>? views,
    List<PollOption>? options,
    User? user,
    List<PollVote>? votes,
    String? subject,
    String? content,
    dynamic link,
  }) =>
      Post(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        pollQuestion: pollQuestion ?? this.pollQuestion,
        state: state ?? this.state,
        city: city ?? this.city,
        device: device ?? this.device,
        expiresAt: expiresAt ?? this.expiresAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        comments: comments ?? this.comments,
        stars: stars ?? this.stars,
        views: views ?? this.views,
        options: options ?? this.options,
        user: user ?? this.user,
        votes: votes ?? this.votes,
        subject: subject ?? this.subject,
        content: content ?? this.content,
        link: link ?? this.link,
      );
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  /// Connect the generated [_$PostToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
