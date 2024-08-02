import 'package:recenth_posts/src/utils/components/app_custom_loader.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polls/flutter_polls.dart';

import '../../../../../logic/models/app/user_model.dart';
import '../post/model/post_model.dart';
import 'bloc/poll_bloc.dart';
import 'bloc/poll_event.dart';
import 'bloc/poll_state.dart';
import 'models/poll_vote_payload.dart';

class PollsView extends StatefulWidget {
  final Post post;
  const PollsView({Key? key, required this.post}) : super(key: key);

  @override
  State<PollsView> createState() => _PollsViewState();
}

class _PollsViewState extends State<PollsView> {
  bool hasVoted(Post post) {
    final user = User.getPresentUser();

    for (final option in post.options ?? []) {
      for (final vote in option.pollVotes ?? []) {
        if (vote.userId == user.id) {
          return true;
        }
      }
    }

    return false;
  }

  int? getUserVote(Post post) {
    final user = User.getPresentUser();
    int? id;

    post.options?.forEach((option) {
      option.pollVotes?.forEach((vote) {
        if (vote.userId == user.id) {
          setState(() {
            id = option.id;
          });
        }
      });
    });
    return id;
  }

  @override
  Widget build(BuildContext context) {
    final int days = DateTime(
      widget.post.expiresAt!.year,
      widget.post.expiresAt!.month,
      widget.post.expiresAt!.day,
    )
        .difference(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ))
        .inDays;

    return BlocListener<PollBloc, PollState>(
      listener: (BuildContext context, state) {},
      child: FlutterPolls(
        pollId: widget.post.id.toString(),
        votedProgressColor: AppColors.kprimaryColor600,
        voteInProgressColor: AppColors.kprimaryColor300,
        votedPercentageTextStyle: TextStyle(
          color: AppColors.kblackColor,
          fontFamily: 'Poppins',
          fontSize: 12,
        ),
        pollOptionsBorder: Border.all(color: AppColors.kprimaryColor700),
        pollOptionsBorderRadius: BorderRadius.circular(30),
        votedBackgroundColor: AppColors.kprimaryColor200.withOpacity(0.5),
        leadingVotedProgessColor: AppColors.kprimaryColor700,
        votedAnimationDuration: 500,
        hasVoted: hasVoted(widget.post),
        userVotedOptionId: getUserVote(widget.post).toString(),
        loadingWidget: AppLoadingIndicator(size: 5),
        onVoted: (PollOption pollOption, int newTotalVotes) async {
          context.read<PollBloc>().add(
                LoadPollEvent(
                  PollVotePayload(
                    pollOptionId: int.parse(pollOption.id!),
                  ),
                ),
              );
          // await Future.delayed(const Duration(seconds: 3));

          /// If HTTP status is success, return true else false
          return true;
        },
        pollEnded: days < 0,
        pollTitle: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.post.pollQuestion!,
            style: TextStyle(
              color: AppColors.kblackColor.withOpacity(0.8),
              fontFamily: 'Poppins',
              fontSize: 14,
            ),
          ),
        ),
        pollOptions: List<PollOption>.from(
          widget.post.options!.map(
            (option) => PollOption(
              id: option.id.toString(),
              title: Text(
                option.optionValue!,
                style: TextStyle(
                  color: AppColors.kblackColor.withOpacity(0.8),
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              votes: option.pollVotes?.length ?? 0,
            ),
          ),
        ),
        metaWidget: Row(
          children: [
            const SizedBox(width: 6),
            const Text(
              '•',
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              days < 0 ? "ended" : "ends in $days days",
            ),
          ],
        ),
      ),
    );
  }
}
