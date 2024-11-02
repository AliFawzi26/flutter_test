class NotificationModel {
  String title;
  String subtitle;
  DateTime timeReceived;

  NotificationModel({required this.title, required this.subtitle, required this.timeReceived});


  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'timeReceived': timeReceived.toIso8601String(),
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      subtitle: json['subtitle'],
      timeReceived: DateTime.parse(json['timeReceived']), 
    );
  }
}
