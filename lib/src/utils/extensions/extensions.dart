import '../enums/enums.dart';

class AppExtensions {}

extension TruncateAndAddSeeMore on String {
  String truncateAndAddSeeMore(
      {int maxLength = 20, String seeMoreText = '...see more'}) {
    if (length <= maxLength) return this;

    final truncatedString = substring(0, maxLength);

    return "$truncatedString$seeMoreText";
  }
}

extension CommentTypeFromString on String {
  CommentType get toCommentType {
    switch (toLowerCase()) {
      case 'comment':
        return CommentType.Comment;
      case 'reply':
        return CommentType.Reply;
      default:
        throw ArgumentError('Invalid CommentType string: $this');
    }
  }
}
