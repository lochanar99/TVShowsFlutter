
final String tableReminders = 'reminders';

class RemindersFields{
  static final String id = '_id';
  static final String channel = 'channel';
  static final String show = 'show';
  static final String timer = 'timer';
}

class Reminders {

  final int? id;
  final String channel;
  final String show;
  final String timer;

  const Reminders({
    this.id,
    required this.channel,
    required this.timer,
    required this.show
});

  Reminders copy({
  int? id,
    String? channel,
    String? show,
    String? timer

}) =>
  Reminders(
    id: id?? this.id,
    channel: channel ?? this.channel,
    show: show ?? this.show,
    timer: timer ?? this.timer
  );

  Map<String, Object?> toJson() => {
    RemindersFields.id: id,
    RemindersFields.channel: channel,
    RemindersFields.show: show,
    RemindersFields.timer: timer,

  };
}