/// Model for observer. This is the person performing the TTT
class Observer {
  late final String observerName;

  Observer({required this.observerName});

  factory Observer.fromJson(Map<String, dynamic> json) {
    return Observer(observerName: json['observerName']);
  }

  @override
  String toString() {
    return observerName;
  }
}
