class SenderMessageModel {
  final String message;
  final int second;

  SenderMessageModel({
    required this.message,
    required this.second,
  });

  SenderMessageModel copyWith({
    String? message,
    int? second,
  }) {
    return SenderMessageModel(
      message: message ?? this.message,
      second: second ?? this.second,
    );
  }
}
