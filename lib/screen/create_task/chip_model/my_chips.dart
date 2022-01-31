class MyTopic {
  String title;
  bool isSelected;

  @override
  String toString() {
    return 'MyTopic{title: $title, isSelected: $isSelected}';
  }

  MyTopic(this.title, {this.isSelected = false});

  static List<MyTopic> topics = [
    MyTopic('Design'),
    MyTopic('Meeting'),
    MyTopic('Coding'),
    MyTopic('BDE'),
    MyTopic('Testing'),
    MyTopic('Quic call'),
  ];
}
