// To parse this JSON data, do
//
//     final pollPayload = pollPayloadFromJson(jsonString);

import 'dart:convert';

PollPayload pollPayloadFromJson(String str) => PollPayload.fromJson(json.decode(str));

String pollPayloadToJson(PollPayload data) => json.encode(data.toJson());

class PollPayload {
    int? userId;
    String? pollQuestion;
    String? state;
    String? city;
    Duration? duration;
    String? device;
    String? postType;
    List<String>? options;

    PollPayload({
        this.userId,
        this.pollQuestion,
        this.state,
        this.city,
        this.duration,
        this.device,
        this.postType,
        this.options,
    });

    PollPayload copyWith({
        int? userId,
        String? pollQuestion,
        String? state,
        String? city,
        Duration? duration,
        String? device,
        String? postType,
        List<String>? options,
    }) => 
        PollPayload(
            userId: userId ?? this.userId,
            pollQuestion: pollQuestion ?? this.pollQuestion,
            state: state ?? this.state,
            city: city ?? this.city,
            duration: duration ?? this.duration,
            device: device ?? this.device,
            postType: postType ?? this.postType,
            options: options ?? this.options,
        );

    factory PollPayload.fromJson(Map<String, dynamic> json) => PollPayload(
        userId: json["user_id"],
        pollQuestion: json["poll_question"],
        state: json["state"],
        city: json["city"],
        duration: json["duration"] == null ? null : Duration.fromJson(json["duration"]),
        device: json["device"],
        postType: json["post_type"],
        options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "poll_question": pollQuestion,
        "state": state,
        "city": city,
        "duration": duration?.toJson(),
        "device": device,
        "post_type": postType,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
    };
}

class Duration {
    int? count;
    String? type;

    Duration({
        this.count,
        this.type,
    });

    Duration copyWith({
        int? count,
        String? type,
    }) => 
        Duration(
            count: count ?? this.count,
            type: type ?? this.type,
        );

    factory Duration.fromJson(Map<String, dynamic> json) => Duration(
        count: json["count"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "type": type,
    };
}
